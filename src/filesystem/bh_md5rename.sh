bh_md5rename()
{
	IFS=
	local md5_hash=
	local i=

	[ -n "$1" ] || return

	if which -s md5sum; then
		for i in $*; do
			md5_hash=$(md5sum "$i" | cut -d' ' -f1)
			mv "$i" $md5_hash
		done
	elif which -s md5; then
		for i in $*; do
			md5_hash=$(md5 "$i" | cut -d= -f2 | tr -d ' ')
			mv "$i" $md5_hash
		done
	fi
}
