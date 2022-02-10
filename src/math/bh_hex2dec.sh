bh_hex2dec() {
    (( $# < 1 )) && return 1

    echo $(( 0x${1#0x} ))
}