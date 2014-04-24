hostcalc()
{
    local USAGE="Returns the total number of hosts based on subnet mask informed.\n
   hostcalc <number>\n
   Category  : Networking.\n
   Parameters:
        number : bit mask network.
        -h     : Help\n
   Output:
   \$ hostcalc 24
   256"

    local iCidr
    local iTotalHost

    isdigit $1

    [ $? -eq 0 \
        -a $1 -le 30 \
        -a $1 -ge 2 ] || {
        echo -e "${USAGE}"
        return 1;
    }

    iCidr=$1
    iTotalHost=$(pow 2 $((32-iCidr)))
    echo ${iTotalHost} - 2 | bc
}