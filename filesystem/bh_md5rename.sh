bh_md5rename()
{
	IFS=
    local md5=
	[ -n "$1" ] || return
	for i in $*; do
		md5=$(md5sum "$i" | cut -d' ' -f1)
        mv "$i" "$md5"
	done
}
