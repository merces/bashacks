bh_str2dec() {
	(( $# < 1 )) && return 1

	# count the number of digits of the param ($1)
	# and print each one with printf in the decimal format
	#
	local param_length=${#1}
	for (( i=0; i<$param_length; i++ )); do

		# avoid the last space in the last char, if this last space exists
		# other modules can fail
		(( (i + 1) < param_length )) && { printf "%d " "'${1:$i:1}'"; continue; }

		printf "%d" "'${1:$i:1}'"
	done

	echo
}

bh_asc2dec() {
    echo "WARNING: bh_asc2dec() is depcreated and will be removed in the next release. Use bh_str2dec() instead."
	(( $# < 1 )) && return 1

	bh_str2dec "$1"
}
