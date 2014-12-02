bh_bin2dec()
{
     local USAGE="Convert binary to decimal equivalent.\n
    bh_bin2dec <binary>\n
    Category  : Base Conversion\n
    Parameters:
        binary : binary to be converted\n
    Output:
    \$ bh_bin2dec 1010
    10
    \$ bh_dec2bin 11111111
    255"

    [ $# -eq 0 -o "$1" == '-h' ] && {
        echo -e "${USAGE}" 
        return 1
    }

    echo $((2#$1))
}
