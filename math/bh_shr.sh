bh_shr()
{
    local USAGE="Push bits to the right by a number.\n
   bh_shr <number> <bits>\n
   Category  : Calc.\n
   Parameters:
        -h       :  Help.
        bits     :  The number of bits to be pushed.
        number   :  Decimal or hex number (prefixed with '0x').\n
   Output:
   \$ bh_shr 4 1
   2
   \$ bh_shr 0x4 1
   2"

    [ $# -lt 2 -o "$1" == '-h' ] && {
        echo -e "${USAGE}"
        return 1
    }

    echo $(($1>>$2))
}
