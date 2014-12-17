bh_isxdigit()
{
    [ $# -ne 1 ] && return 1 

    echo "$1" | grep -Eqw '^[0-9A-Fa-f]+$'
}
