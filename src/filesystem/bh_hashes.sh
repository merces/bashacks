bh_hashes() {
	(( $# < 1 )) && return 1

	local i

	for i in $*; do
		echo $(bh_cmd_md5 "$i")
		echo $(bh_cmd_sha1 "$i")
		echo $(bh_cmd_sha256 "$i")
	done | tr -s ' ' ' '
}
