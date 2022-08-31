module vtpcache

import time

fn test_ok() ? {
	mut mm := vtpcache_new(TCatalog{}) or { panic(err) }
	data := 'hey'
	mut lease := mm.retrieve('mykey') or { panic(err) }
	if lease.is_expired() {
		lease.must_expire_in(1 * time.second)?
		mm.renew(mut lease, data)?
	}
	r := lease.get_content()
	assert r == 'hey'
}

fn test_cached() ? {
	mut mm := vtpcache_new(TCatalog{}) or { panic(err) }
	mut lease := mm.retrieve('mykey') or { panic(err) }
	r := lease.get_content()
	assert lease.is_expired() == false
	assert r == 'hey'
}

fn test_expired() ? {
	time.sleep(1 * time.second)
	mut mm := vtpcache_new(TCatalog{}) or { panic(err) }
	mut lease := mm.retrieve('mykey') or { panic(err) }
	r := lease.get_content()
	assert lease.is_expired() == true
}
