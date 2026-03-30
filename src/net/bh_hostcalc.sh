bh_hostcalc() {
        (( $# < 1 )) && return 1

        local prefix=${1##*/}
        echo $((2**(32-prefix) - 2))
}
