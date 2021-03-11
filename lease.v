// vi: ft=vlang
module vtpcache


pub struct TLease {
	key       string [required]
	content   string [required]
	expire_in i64
}
