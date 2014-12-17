bh_pow()
{
    [ $# -lt 2 ] && return 1 

    echo $(($1**$2))
}
