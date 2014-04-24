shr()
{
    local USAGE="Push bits to the right by a number.\n
   shr <number> <bits>\n
   Category  : Calc.\n
   Parameters:
        -h       :  Help.
        bits     :  The number of bits to be pushed.
        number   :  Decimal or hex number (prefixed with '0x').\n
   Output:
   \$ shr 4 1
   2
   \$ shr 0x4 1
   2"

    [ $# -lt 2 -o "$1" == '-h' ] && {
        echo -e "${USAGE}"
        return 1
    }

    echo $(($1>>$2))
}