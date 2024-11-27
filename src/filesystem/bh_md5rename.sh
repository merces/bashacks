bh_md5rename() {
	(( $# < 1 )) && return 1

	local md5_hash
	local i

	for i in $*; do
		md5_hash=$(bh_cmd_md5 "$i" | cut -d" " -f1)
		[[ $md5_hash ]] && mv -v "$i" $(dirname "$i")/$md5_hash
	done
}
