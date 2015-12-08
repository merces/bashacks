bh_hashes()
{
	IFS=
	[ -n "$1" ] || return
	for i in $*; do
		md5sum "$i"
		sha1sum "$i"
		sha256sum "$i"
	done
}
