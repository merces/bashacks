bh_strxor()
{
    [ $# -lt 2 ] && return 1

    local str
    local xored
    local i

    # $2 is the string and $1 is the xor key
    str=$(bh_str2hex "$2")

    for i in $str; do
       		xored="$xored $(bh_dec2hex $((0x$i^$1)))"
   	done

   	bh_hex2str "$xored"
}
