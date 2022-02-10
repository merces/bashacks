bh_dec2asc() {
    (( $# < 1 )) && return 1

    echo -e $(printf "\\\x%x" $1)
}