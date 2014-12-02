bh_hex2dec()
{
    local USAGE="Convert hex to decimal equivalent\n
    bh_hex2dec <hex>\n
    Category  : Base Conversion\n
    Parameters:
        hex : hex to be converted\n
    Output:
    \$ bh_hex2dec a
    10
    \$ bh_hex2dec 0x0a
    10"

    [ $# -eq 0 -o "$1" == '-h' ] && {
        echo -e "${USAGE}"
        return 1
    }

    echo $((0x${1#0x}))
}
