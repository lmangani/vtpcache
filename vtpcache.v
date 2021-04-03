module vtpcache


pub fn vtpcache_new(c TCatalog) ?TMiddleman {
	if c.default_term < 1 {
		return error('vtpcache: default term must be greater than zero')
	}

	c.init()
	return TMiddleman{ catalog: c }
}
