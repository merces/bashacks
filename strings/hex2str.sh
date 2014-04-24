hex2str()
{
    local USAGE="Converts one or more bytes into a hex string. Accepts as input all output formats str2hex function.\n
        hex2str <hex>\n
        Category  : Char and String\n
        Parameters:
            -h  :    Help.
            hex : hex to be converted.\n
        Output:
        \$ hex2str '72 6f 63 6b'
        rock
        \$ hex2str '\x72\x6f\x63\x6b'
        rock
        \$ hex2str '0x72 0x6f 0x63 0x6b'
        rock
        \$ hex2str '{0x72, 0x6f, 0x63, 0x6b}'
        rock"

    [ $# -ne 1 -o "$1" == '-h' ] && { 
        echo -e "${USAGE}" 
        return 1
    }

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