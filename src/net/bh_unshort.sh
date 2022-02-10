bh_unshort() {
    (( $# < 1 )) && return 1
    
    bh_cmd_wget --max-redirect 0 --spider "$1" 2>&1 | grep -E '^Loca(tion|liza..o):' | cut -d' ' -f2
}
