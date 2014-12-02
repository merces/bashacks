bh_hostcalc()
{
    local USAGE="Returns the total number of hosts based on subnet mask informed.\n
   bh_hostcalc <number>\n
   Category  : Networking.\n
   Parameters:
        number : bit mask network.
        -h     : Help\n
   Output:
   \$ bh_hostcalc 24
   256"

    local iCidr
    local iTotalHost

    bh_isdigit $1

    [ $? -eq 0 \
        -a $1 -le 30 \
        -a $1 -ge 2 ] || {
        echo -e "${USAGE}"
        return 1;
    }

    iCidr=$1
    iTotalHost=$(bh_pow 2 $((32-iCidr)))
    echo ${iTotalHost} - 2 | bc
}
