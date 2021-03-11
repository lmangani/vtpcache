// vi: ft=vlang
module vtpcache


struct TMiddleman {
	catalog TCatalog
}

pub fn (m TMiddleman) put(lease TLease) {
	mut term := m.catalog.default_term
	if lease.expire_in < 0 {
		panic('lease term cannot be a negative number')
	}

	if lease.expire_in > 1 {
		term = lease.expire_in
	}

	println(term)
}
