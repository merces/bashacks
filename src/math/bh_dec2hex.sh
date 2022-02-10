bh_dec2hex() {
    (( $# < 1 )) && return 1

    printf "%x\n" "$1"
}