bin2dec()
{
     local USAGE="Convert binary to decimal equivalent.\n
    bin2dec <binary>\n
    Category  : Base Conversion\n
    Parameters:
        binary : binary to be converted\n
    Output:
    \$ bin2dec 1010
    10
    \$ dec2bin 11111111
    255"

    [ $# -eq 0 -o "$1" == '-h' ] && {
        echo -e "${USAGE}" 
        return 1
    }

    echo $((2#$1))
}