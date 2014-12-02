bh_dec2asc()
{
     local USAGE="Converts decimal to ascii bytes equivalent.\n
   bh_dec2asc <decimal>\n
   Category  : Char and String\n
   Parameters:
        decimal : decimal number to be coverted.\n
   Output:
   \$ bh_dec2asc 65
   A"

    [ $# -ne 1 -o "$1" == '-h' ] && {
        echo -e "${USAGE}"
        return 1
    }

    echo -e $(printf "\\\x%x" $1)
}
