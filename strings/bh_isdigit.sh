bh_isdigit()
{
    [ $# -ne 1 ] && return 1

    echo "$1" | grep -Eqw '^[0-9]+$'
}
