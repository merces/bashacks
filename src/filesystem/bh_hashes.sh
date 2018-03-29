bh_hashes() {
	IFS=
	local i

	[[ -n "$1" ]] || return 1
	
	for i in $*; do
		bh_cmd_md5 "$i"
		bh_cmd_sha1 "$i"
		bh_cmd_sha256 "$i"
		#bh_cmd_sha512 "$i"
	done | tr -s ' ' ' '
}