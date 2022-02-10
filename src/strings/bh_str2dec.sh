bh_str2dec() {
	(( $# < 1 )) && return 1

	echo -n "$1" | hexdump -ve '/1 "%d "' | sed 's/\(.*\) /\1/'
	echo
}