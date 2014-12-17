bh_hex2dec()
{
    [ $# -eq 0 ] && return 1 

    echo $((0x${1#0x}))
}
