bh_bin2ip()
{
    local sBin="$(echo $1 |
                grep -Ewo '^(([0-1]){8}\.){3}([0-1]){8}$')"

    [ $# -eq 0 -o -z "${sBin}" ] && return 1 

	local i
	for i in $(echo "${sBin}" | tr . ' '); do
	    printf "%d." $(bh_bin2dec $i)
    done | sed "s/.$/\\n/"
}
