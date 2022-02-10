bh_strxor() {
    (( $# < 2 )) && return 1
    
    local str
    local xored
    local i

    # $2 is the string and $1 is the xor key
    str=$(bh_str2dec "$2")

    for i in $str; do
        xored=$(( $i ^ $1 ))
        echo -ne "$(bh_dec2asc $xored)"
   	done
   	echo
}