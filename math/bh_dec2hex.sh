bh_dec2hex()
{
    local USAGE="Convert decimal to hex equivalent.\n
    bh_dec2hex <decimal>\n
    Category  : Base Conversion\n
    Parameters:
        decimal  :  integer to be converted\n
    Output:
    \$ bh_dec2hex 10
    a"

    [ $# -eq 0 -o "$1" == '-h' ] && {
        echo -e "${USAGE}" 
        return 1
    }

    printf "%x\n" "$1"
}
