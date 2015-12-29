bh_asmgrep()
{
    [ $# -lt 2 ] && return 1 

    objdump -d "$2" | grep --color -EC4 "$1"
}