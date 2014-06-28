isgraph()
{
     local USAGE="Determines whether char is graph.\n
   isgraph <char>\n
   Category  : Char and String\n
   Parameters:
        char : char to be analyzed.\n
    Output:
    \$ isgraph a
    \$ echo \$? 
    0
    \$ isgraph ²
    \$ echo \$? 
    1"

    local char_in="$1"

    # dec 33 - 126

    [ "${#char_in}" -gt 2 -o \
        "${char_in}" == '-h' ] && {
        echo -e "${USAGE}"
        return 1
    }

    [ $(asc2dec "${char_in}") -ge 33 -a \
        $(asc2dec "${char_in}") -le 126 ] &&
        return 0 

    return 1
}
