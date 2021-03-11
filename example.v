// vi: ft=vlang
module main

import time { second }
import vtpcache { vtpcache_new, TCatalog }


fn main() {
	mm := vtpcache_new(TCatalog{})

	data := 'hey'

	mut lease := mm.retrieve('my key')
	if lease.is_expired() {

		lease.must_expire_in(5 * second)
		mm.renew(mut lease, data)
	}

	println(lease.get_content())
}
