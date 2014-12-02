bh_isalnum()
{
   local USAGE="Determines whether string or char is alphanumeric.\n
   bh_isalnum <string|char>\n
   Category  : Char and String\n
   Parameters:
        string or char : return true or false.\n
    Output:
    \$ bh_isalnum a1
    \$ echo \$? 
    0
    \$ bh_isalnum a-a
    \$ echo \$? 
    1"

    [ $# -ne 1 -o "$1" == '-h' ] && {
        echo -e "${USAGE}" 
        return 1
    }

    echo "$1" | grep -Eqw '^[0-9A-Za-z]+$'
}
