bh_dec2hex()
{
    [ $# -eq 0 ] && return 1

    printf "%x\n" "$1"
}
