bh_hashes() {
	(( $# < 1 )) && return 1

	local i
	
	for i in $*; do
		bh_cmd_md5 "$i"
		bh_cmd_sha1 "$i"
		bh_cmd_sha256 "$i"
		#bh_cmd_sha512 "$i"
	done | tr -s ' ' ' '
}