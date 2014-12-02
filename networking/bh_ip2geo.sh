ip2geo()
{
    local USAGE="Approximately determines geographical location of an ip address or domain name.\n
   ip2geo <ip address>\n
   Category  : Networking.\n
   Parameters:
        -h        : Help.
        Ip adrress: Ip to determine location.\n
   Output:
   \$ ip2geo www.mentebinaria.com
   www.mentebinaria.com.br New Dream Network, LLC New Dream Network, LLC Brea US 33.926898956299 -117.86119842529 1"

    [ $# -eq 0 -o "$1" == '-h' ] && {
        echo -e "${USAGE}"
        return 1
    }

    wget -q -T 30 "http://xml.utrace.de/?query=$1" -O - |
	        sed -e '4d; s/<[^>]*>//g; s/\t//g; /^$/d' |
	        tr \\n ' '
            echo
}