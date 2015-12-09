bh_dlsite()
{
	wget -crw $((($RANDOM%10)+1)) \
 --user-agent 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:28.0) Gecko/20100101 Firefox/28.0' \
 "$1"
}
