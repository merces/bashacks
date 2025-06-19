bh_str2dec() {
	(( $# < 1 )) && return 1

	for i in ${1//?/& }; do
		printf "%d " "'$i'"
	done
	echo
}

bh_asc2dec() {
    echo "WARNING: bh_asc2dec() is depcreated and will be removed in the next release. Use bh_str2dec() instead."
	(( $# < 1 )) && return 1

	bh_str2dec $1
}
