bh_hostcalc() {
	echo $((2**(32-$1) - 2))
}