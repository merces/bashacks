isxdigit()
{
     local USAGE="Determines whether string or char is hex digit.\n
   isxdigit <string|char>\n
   Category  : Char and String\n
   Parameters:
        string or char : return true or false.\n
   Output:
   \$ isxdigit 2f 
   \$ echo \$?
   0
   \$ isxdigit HA
   \$ echo \$?
   1"

    [ $# -ne 1 -o "$1" == '-h' ] && {
        echo -e "${USAGE}"
        return 1
    }

    echo "$1" | grep -Eqw '^[0-9A-Fa-f]+$'
}