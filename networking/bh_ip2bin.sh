bh_ip2bin()
{
    local sIp="$(echo $1 |
                grep -Eo '^(([0-9]){1,3}\.){3}([0-9]){1,3}$')"

    [ $# -eq 0 -o -z "${sIp}" ] && return 1 

    local i
	for i in $(echo "${sIp}" | tr . ' '); do
	    printf "%.8d." $(bh_dec2bin $i)
    done | sed "s/.$/\\n/"
}
