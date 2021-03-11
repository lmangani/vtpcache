// vi: ft=vlang
module vtpcache


fn die(message string) {
	panic('vtpcache: $message')
}

pub fn vtpcache_new(c TCatalog) TMiddleman {
	if c.default_term < 1 {
		die('default term must be greater than zero; got "$c.default_term"')
	}

	c.init()
	return TMiddleman{ catalog: c }
}
