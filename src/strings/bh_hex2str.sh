bh_hex2str()
{
    [ $# -ne 1 ] && return 1 

    local hex
    local str
    local i

    hex=$(echo $1 | sed 's/\(0x\|\\x\| \|{\|}\|,\)//g')

    # insert a space each two chars
    hex=$(echo $hex | sed 's/../& /g')

    # prefix with \x, needed by echo
    for i in $hex; do
    	str="$str\\x$i"
    done

    echo -e $str
}
