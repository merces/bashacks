bh_ip2geo()
{
    [ $# -eq 1 ] || return 1
    
    bh_cmd_wget -q "http://xml.utrace.de/?query=$1" -O - \
	 | sed -e '4d; s/<[^>]*>//g; s/\t//g; /^$/d' \
	 | tr \\n ' '
	echo
}
