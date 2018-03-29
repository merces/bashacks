bh_ip2geo()
{
  local ip=

  [[ $# -eq 1 ]] && ip=$1 || ip=$(bh_myip)
    
  bh_cmd_wget -q "http://xml.utrace.de/?query=$ip" -O - \
	 | sed -e '4d; s/<[^>]*>//g; /^$/d' | uniq | tr \\n ' '
	echo
}