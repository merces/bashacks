xor()
{
    local USAGE="Calculates the exclusive OR between two numbers.\n
    xor <number> <number>\n
   Category  : Calc.\n
   Parameters:
        -h       :  Help.
        number   :  decimal  or hex number (prefixed with '0x' ).\n
   Output:
   \$ xor 0xdead 0xdead
   0
   \$ xor 45 20
   57"

   [ $# -lt 2  -o "$1" == '-h' ] && {
        echo -e "${USAGE}"
        return 1
    }

    echo $(($1^$2))
}