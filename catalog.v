module vtpcache

import os


pub struct TCatalog {
	location  string = os.getenv('HOME')
	name      string = '.vtpcache'
	default_term i64 = 15000
}

fn (c TCatalog) get_path() string {
	return os.join_path(c.location, c.name)
}

fn (c TCatalog) get_fpath(name string) string {
	return os.join_path(c.get_path(), name)
}

fn (c TCatalog) exists(key string) bool {
	return os.exists(c.get_fpath(key))
}

fn (c TCatalog) init() ? {
	p := c.get_path()

	os.mkdir_all(p) or {
		return error('vtpcache: could not initialize catalog at path "$p"')
	}
}

fn (c TCatalog) read(filename string) ?[]string {
	p := c.get_fpath(filename)

	l := os.read_lines(p) or {
		return error('vtpcache: could not read file at path "$p"')
	}
	return l
}

fn (c TCatalog) write(filename string, content string) ? {
	p := c.get_fpath(filename)

	os.write_file(p, content) or {
		return error('vtpcache: could not write file at path "$p"')
	}
}
