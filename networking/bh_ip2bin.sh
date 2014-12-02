bh_ip2bin()
{
    local USAGE="Convert an ip address into its equivalent binary.\n
   bh_ip2bin <ipaddress>\n
   Category  : Networking.\n
   Parameters:
        -h     : Help.
        string : Ipaddress to be converted.\n
   Output:
   \$ bh_ip2bin 10.0.0.1
   00001010.00000000.00000000.00000001
   \$ bh_ip2bin 172.16.1.0
   10101100.00010000.00000001.00000000"

    local sIp="$(echo $1 |
                grep -Eo '^(([0-9]){1,3}\.){3}([0-9]){1,3}$')"

    [ $# -eq 0 -o -z "${sIp}" -o "$1" == '-h' ] && {
        echo -e "${USAGE}"
        return 1
    }

    local i
	for i in $(echo "${sIp}" | tr . ' '); do
	    printf "%.8d." $(bh_dec2bin $i)
    done | sed "s/.$/\\n/"
}
