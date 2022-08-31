module main

import time
import vtpcache { vtpcache_new, TCatalog }


fn main() {
	mm := vtpcache_new(TCatalog{}) or { panic(err) }

	data := 'hey'

	mut lease := mm.retrieve('my key') or { panic(err) }
	if lease.is_expired() {

		lease.must_expire_in(5 * time.second)?
		mm.renew(mut lease, data)?
	}

	println(lease.get_content())
}
