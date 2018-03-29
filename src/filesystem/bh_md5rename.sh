bh_md5rename() {
	IFS=
	local md5_hash=
	local i=

	[[ -n "$1" ]] || return 1

	for i in $*; do
		md5_hash=$(bh_cmd_md5 "$i" | cut -d= -f2 | tr -d ' ')
		echo $md5_hash
		#mv "$i" $md5_hash
	done
}