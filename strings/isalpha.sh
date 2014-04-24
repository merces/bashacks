isalpha()
{
   local USAGE="Determines whether string or char is alpha.\n
   isalpha <string|char>\n
   Category  : Char and String\n
   Parameters:
        string or char : return true or false.\n
   Output:
   \$ isalpha Hf
   \$ echo \$? 
   0
   \$ isalpha Hf-1
   \$ echo \$? 
   1"

    [ $# -ne 1 -o "$1" == '-h' ] && {
        echo -e "${USAGE}"
        return 1
    }

    echo "$1" | grep -Eqw '^[A-Za-z]+$'
}