bin2ip()
{
    local USAGE="Convert an binary into its equivalent decimal.\n
   bin2ip <binary ipaddress>\n
   Category  : Networking.\n
   Parameters:
        -h     : Help.
        binary ipaddress : Binary address to be converted to decimal.\n
   Output:
   \$ bin2ip 00001010.00000000.00000000.00000001
   10.0.0.1
   \$ bin2ip 10101100.00010000.00000001.00000000
   172.16.1.0"

    local sBin="$(echo $1 |
                grep -Ewo '^(([0-1]){8}\.){3}([0-1]){8}$')"

    [ $# -eq 0 -o -z "${sBin}" -o "$1" == '-h' ] && {
        echo -e "${USAGE}"
        return 1
    }

	local i
	for i in $(echo "${sBin}" | tr . ' '); do
	    printf "%d." $(bin2dec $i)
    done | sed "s/.$/\\n/"
}