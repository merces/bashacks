bh_wgetr()
{
	[ "$1" ] || return
	local ua='Mozilla/5.0 (Windows NT 6.1; WOW64; rv:28.0) Gecko/20100101 Firefox/28.0'
	wget -crw $((($RANDOM%10)+1)) --user-agent "$ua" "$1"
}
