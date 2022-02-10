bh_bin2dec() {
    (( $# < 1 )) && return 1
    
    echo $((2#$1))
}