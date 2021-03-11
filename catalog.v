// vi: ft=vlang
module vtpcache

import os { getenv, join_path, mkdir_all, write_file }


pub struct TCatalog {
	location  string = getenv('HOME')
	name      string = '.vtpcache'
	default_term i64 = 15000
}

fn (c TCatalog) get_path() string {
	return join_path(c.location, c.name)
}

fn (c TCatalog) init() {
	p := c.get_path()

	mkdir_all(p) or {
		die('could not initialize catalog at path "$p"')
	}
}

fn (c TCatalog) read() string {
	return ''
}

fn (c TCatalog) write(filename string, content string) {
	f := join_path(c.get_path(), filename)

	write_file(f, content) or {
		die('could not write file at path "$f"')
	}
}
