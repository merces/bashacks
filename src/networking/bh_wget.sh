bh_get()
{
	[ "$1" ] || return
	local ua='Mozilla/5.0 (Windows NT 6.1; WOW64; rv:28.0) Gecko/20100101 Firefox/28.0'
	wget -c --user-agent "$ua" "$1"
}
