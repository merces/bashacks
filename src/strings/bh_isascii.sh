bh_isascii() {
    local c2d=$(bh_asc2dec $1)

    return [ $c2d -gt 0 -a $c2d -lt 127 ]
}
