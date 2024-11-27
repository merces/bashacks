bh_ip2bin() {
    [[ "$1" =~ [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3} ]] || return 1

    local i
	for i in $(echo "$1" | tr . ' '); do
	    printf "%.8d." $(bh_dec2bin $i)
    done | sed "s/.$//"
    echo
}
