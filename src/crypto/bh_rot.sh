bh_rot() {
	(( $# < 2 )) && return 1

	local n
	local N

	# n gets the alphabet letter
	n=$(echo -e \\x$(bh_dec2hex $(( 97 + $1 )) ) )

	# N gets uppercase n
	N="${n^^}"

	# rot with tr command
	echo $2 | tr a-z $n-za-z | tr A-Z $N-ZA-Z
}
