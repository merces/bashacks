bh_ip2geo()
{
    [ $# -eq 0 -o "$1" == '-h' ] && return 1 

    wget -q -T 30 "http://xml.utrace.de/?query=$1" -O - |
	        sed -e '4d; s/<[^>]*>//g; s/\t//g; /^$/d' |
	        tr \\n ' '
            echo
}
