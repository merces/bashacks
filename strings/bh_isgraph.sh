bh_isgraph()
{
    local char_in="$1"

    # dec 33 - 126

    [ "${#char_in}" -gt 2 ] && return 1 

    [ $(bh_asc2dec "${char_in}") -ge 33 -a \
        $(bh_asc2dec "${char_in}") -le 126 ] &&
        return 0 

    return 1
}
