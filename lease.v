// vi: ft=vlang
module vtpcache

import crypto.md5 { hexhash }
import time { Duration, Time, now, millisecond }


fn repr(key string) string {
	return hexhash(key)
}


struct TLease {
	key     string [required]
	content string [required]

mut:
	expire_in   Duration
	expire_time u64
}

pub fn (l TLease) get_content() string {
	return l.content
}

pub fn (l TLease) get_expire_time() u64 {
	return l.expire_time
}

pub fn (l TLease) is_expired() bool {
	return now().unix_time_milli() > l.expire_time
}

pub fn (mut l TLease) must_expire_in(d Duration) {
	if d.milliseconds() < 1 {
		panic('vtpcache: duration must be greater then or equal to 1 ms')
	}

	l.expire_in = d
}

fn (mut l TLease) sign() string {
	if l.expire_in.milliseconds() == 0 {
		panic('vtpcache: lease term not set')
	}

	l.expire_time = now().add(l.expire_in).unix_time_milli()
	return repr(l.key)
}
