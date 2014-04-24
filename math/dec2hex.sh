dec2hex()
{
    local USAGE="Convert decimal to hex equivalent.\n
    dec2hex <decimal>\n
    Category  : Base Conversion\n
    Parameters:
        decimal  :  integer to be converted\n
    Output:
    \$ dec2hex 10
    a"

    [ $# -eq 0 -o "$1" == '-h' ] && {
        echo -e "${USAGE}" 
        return 1
    }

    printf "%x\n" "$1"
}