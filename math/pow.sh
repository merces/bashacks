pow()
{
    local USAGE="Raises a number to a power.\n
   pow <number> <pow>\n
   Category  : Calc.\n
   Parameters:
        -h       :  Help.
        pow      :  the desired power.
        number   :  Decimal number or hex number (prefixed with '0x').\n
   Output:
   \$ pow 8 2
   64
   \$ pow 0xa 3
   1000"

    [ $# -lt 2 -o "$1" == '-h' ] && {
        echo -e "${USAGE}"
        return 1
    }

    echo $(($1**$2))
}