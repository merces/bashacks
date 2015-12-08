bh_isupper()
{
    [ $# -ne 1 ] && return 1 
 
    echo "$1" | grep -Eqw '^[A-Z]+$'
}
