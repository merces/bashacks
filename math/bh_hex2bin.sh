bh_hex2bin()
{
    [ $# -eq 0 ] && return 1

	local bin
	local i

	for i in $*; do
		bin=$(echo "obase=2;ibase=16;$(echo $i | tr a-f A-F)" | bc)
		echo -n "$bin "
    done
	echo
}
