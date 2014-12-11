bh_hostcalc()
{
    local iCidr
    local iTotalHost

    bh_isdigit $1

    [ $? -eq 0 \
        -a $1 -le 30 \
        -a $1 -ge 2 ] || return 1

    iCidr=$1
    iTotalHost=$(bh_pow 2 $((32-iCidr)))
    echo ${iTotalHost} - 2 | bc
}
