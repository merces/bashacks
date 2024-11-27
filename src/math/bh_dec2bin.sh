bh_dec2bin() {
    (( $# < 1 )) && return 1
    
    echo "obase=2;$1" | bc
}
