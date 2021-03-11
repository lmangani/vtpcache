// vi: ft=vlang
module vtpcache

import os


pub struct TCatalog {
	location  string = os.getenv('HOME')
	name      string = '.vtpcache'
	default_term i64 = 15
}

fn (c TCatalog) get_path() string {
	return os.join_path(c.location, c.name)
}

fn (c TCatalog) init() {
	p := c.get_path()

	os.mkdir_all(p) or {
		die('could not initialize catalog at path "$p"')
	}
}

fn (c TCatalog) read() string {
	return ''
}

fn (c TCatalog) write(content string) {

}
