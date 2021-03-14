// vi: ft=vlang
module vtpcache


struct TMiddleman {
	catalog TCatalog
}

pub fn (m TMiddleman) retrieve(key string) ?TLease {
	keyr := repr(key)

	if !m.catalog.exists(keyr) {
		return TLease{
			key: key,
			content: ''
		}
	}

	docl := m.catalog.read(keyr) or { return error(err) }
	return TLease{
		key: key,
		content:     docl[1..].join('')
		expire_time: docl[0].u64()
	}
}

pub fn (m TMiddleman) renew(mut lease TLease, content string) ? {
	mut term := m.catalog.default_term
	if lease.expire_in > 1 {
		term = lease.expire_in
	}

	lease_signature := lease.sign() or { return error(err) }
	lease_document  := '${lease.expire_time}\n${content}'

	m.catalog.write(lease_signature, lease_document)
}
