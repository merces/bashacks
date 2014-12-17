bh_dec2bin()
{
    [ $# -eq 0 ] && return 1
    echo "obase=2;$1" | bc
}
