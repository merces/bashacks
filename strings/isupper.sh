isupper()
{
    local USAGE="Determines whether char or string is uppercase.\n
   isupper <string>\n
   Category  : Char and String\n
   Parameters:
        string or char : return true or false.\n
   Output:
   \$ isupper HACKFUNCTIONS
   \$ echo \$?
   0
   \$ isupper Hackfunctions
   \$ echo \$?
   1"

    [ $# -ne 1 -o "$1" == '-h' ] && {
        echo -e "${USAGE}" 
        return 1
    }
 
    echo "$1" | grep -Eqw '^[A-Z]+$'
}