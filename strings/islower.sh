islower()
{
    local USAGE="Determines whether char or string is lowercase.\n
   islower <string|char>\n
   Category  : Char and String\n
   Parameters:
        string or char : return true or false.\n
   Output:
   \$ islower hackfunctions
   \$ echo \$? 
   0
   \$ islower Hackfunctions
   \$ echo \$? 
   1"

    [ $# -eq 0 -o "$1" == '-h' ] &&
        echo -e "${USAGE}" ||
            echo "$1" | grep -Eqw '^[a-z]+$'
}