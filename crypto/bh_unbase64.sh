bh_unbase64()
{
    [ $# -eq 0 ] && return 1
    echo $1 | base64 -d
    echo
}
