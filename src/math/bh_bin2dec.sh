bh_bin2dec()
{
    [ $# -eq 0 ] && return 1

    echo $((2#$1))
}
