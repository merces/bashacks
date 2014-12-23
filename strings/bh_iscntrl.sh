bh_iscntrl() {
    local iCHAR=$(bh_asc2dec "$1")
    [ $iCHAR -le 31 -o \
        $iCHAR -eq 127 ] && return 0 ||
            return 1
}
