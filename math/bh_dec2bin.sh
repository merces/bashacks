bh_dec2bin()
{
    local USAGE="Convert decimal to binary equivalent.\n
    bh_dec2bin <decimal>\n
    Category  : Base Conversion\n
    Parameters:
        decimal : decimal to be converted\n
    Output:
    \$ bh_dec2bin 10
    1010
    \$ bh_dec2bin 255
    11111111"

    [ $# -eq 0 -o "$1" == '-h' ] && {
        echo -e "${USAGE}" 
        return 1
    }

    echo "obase=2;$1" | bc
}
