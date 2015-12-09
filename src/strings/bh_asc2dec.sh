bh_asc2dec()
{
    [ $# -ne 1 ] && return 1 

    printf "%d\n" "'$1"
}
