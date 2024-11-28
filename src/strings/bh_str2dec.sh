bh_str2dec() {
	(( $# < 1 )) && return 1

	echo -n "$1" | hexdump -ve '/1 "%d "' | sed 's/\(.*\) /\1/'
	echo
}

bh_asc2dec() {
    echo "WARNING: bh_asc2dec() is depcreated and will be removed in the next release. Use bh_str2dec() instead."
	(( $# < 1 )) && return 1

	bh_str2dec $1
}
