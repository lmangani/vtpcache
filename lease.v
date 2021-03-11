// vi: ft=vlang
module vtpcache

import crypto.md5 { hexhash }
import time { Duration, Time, now, millisecond }


pub struct TLease {
	key       string [required]
	content   string [required]
	expire_in i64
}

fn (l TLease) sign() (string, u64) {
	signature := hexhash(l.key)

	d := Duration(l.expire_in * millisecond)
	will_expire_at := now().add(d).unix_time_milli()

	return signature, will_expire_at
}
