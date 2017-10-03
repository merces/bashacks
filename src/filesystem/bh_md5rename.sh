bh_md5rename()
{
	IFS=
	local md5_hash=
	local i=

	[ -n "$1" ] || return

	for i in $*; do
		md5_hash=$(bh_cmd_md5 "$i" | grep -Eo '[0-9a-f]{32}')
		mv "$i" $md5_hash
	done
}
