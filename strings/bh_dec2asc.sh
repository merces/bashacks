bh_dec2asc()
{
    [ $# -ne 1 ] && return 1

    echo -e $(printf "\\\x%x" $1)
}
