bh_hostcalc() {
	(( $# < 1 )) && return 1
	
	echo $((2**(32-$1) - 2))
}