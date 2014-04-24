isdigit()
{
    local USAGE="Determines whether string or char is digit.\n
   isdigit <digit>\n
   Category  : Char and String\n
   Parameters:
        digit : return true or false.\n
    Output:
    \$ isdigit 22
    \$ echo \$? 
    0
    \$ isdigit 2a
    \$ echo \$? 
    1"

    [ $# -ne 1 -o "$1" == '-h' ] && {
        echo -e "${USAGE}"
        return 1
    }

    echo "$1" | grep -Eqw '^[0-9]+$'
}