// vi: ft=vlang
module vtpcache


pub fn vtpcache_new(c TCatalog) TMiddleman {
	if c.default_term < 1 {
		panic('vtpcache: default term must be greater than zero')
	}

	c.init()
	return TMiddleman{ catalog: c }
}
