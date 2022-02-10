bh_asmgrep() {
    (( $# < 2 )) && return 1

    bh_cmd_disasm "$2" | grep --color -EC4 "$1"
}