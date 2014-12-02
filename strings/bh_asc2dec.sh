bh_asc2dec()
{
     local USAGE="Converts ascii bytes in decimal equivalent.\n
   bh_asc2dec <ascii char>\n
   Category  : Char and String\n
   Parameters:
        ascii char : ascii char to be converted.\n
   Output:
   \$ bh_asc2dec A
   65"

    [ $# -ne 1 -o "$1" == '-h' ] && { 
        echo -e "${USAGE}" 
        return 1
    }

    printf "%d\n" "'$1"
}
