bh_isupper()
{
    local USAGE="Determines whether char or string is uppercase.\n
   bh_isupper <string>\n
   Category  : Char and String\n
   Parameters:
        string or char : return true or false.\n
   Output:
   \$ bh_isupper HACKFUNCTIONS
   \$ echo \$?
   0
   \$ bh_isupper Hackfunctions
   \$ echo \$?
   1"

    [ $# -ne 1 -o "$1" == '-h' ] && {
        echo -e "${USAGE}" 
        return 1
    }
 
    echo "$1" | grep -Eqw '^[A-Z]+$'
}
