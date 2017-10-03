bh_asmgrep()
{
    [ $# -lt 2 ] && return 1 

    objdump -dM intel "$2" | grep --color -EC4 "$1"
}
