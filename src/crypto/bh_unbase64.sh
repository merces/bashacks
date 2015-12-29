bh_unbase64()
{
    [ $# -ne 1 ] && return 1
    echo "$1" | base64 -d
    echo
}