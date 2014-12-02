bh_xor()
{
    local USAGE="Calculates the exclusive OR between two numbers.\n
    bh_xor <number> <number>\n
   Category  : Calc.\n
   Parameters:
        -h       :  Help.
        number   :  decimal  or hex number (prefixed with '0x' ).\n
   Output:
   \$ bh_xor 0xdead 0xdead
   0
   \$ bh_xor 45 20
   57"

   [ $# -lt 2  -o "$1" == '-h' ] && {
        echo -e "${USAGE}"
        return 1
    }

    echo $(($1^$2))
}
