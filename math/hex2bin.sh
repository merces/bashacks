hex2bin()
{
    local USAGE="Convert hex to binary equivalent.\n
    hex2bin <hex>\n
    Category  : Base Conversion\n
    Parameters:
        -h  : Help.
        hex : hex to be converted\n
    Output:
    \$ hex2bin a
    1010"

    [ $# -eq 0 -o "$1" == '-h' ] && { 
        echo -e "${USAGE}"
        return 1
    }

	local bin
	local i

	for i in $*; do
		bin=$(echo "obase=2;ibase=16;$(echo $i | tr a-f A-F)" | bc)
		echo -n "$bin "
    done
	echo
}