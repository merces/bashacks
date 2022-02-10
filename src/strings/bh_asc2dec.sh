bh_asc2dec() {
    (( $# < 1 )) && return 1

    printf "%d\n" "'$1"
}