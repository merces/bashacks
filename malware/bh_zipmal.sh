bh_zipmal()
{
	[ -n "$1" ] || return
	local name=${1%\.*}.zip
	zip --encrypt -P virus "$name" $@
	ls -lh "$name"
}
