bh_asmgrep()
{
    [ $# -lt 2 ] && return 1 

    objdump -d "$2" | grep --color -C 4 -E "$1"

}
