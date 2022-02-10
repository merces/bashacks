bh_rotall() {
	(( $# < 1 )) && return 1

	local i

	for i in {1..25}; do
		echo "ROT$i $(bh_rot $i "$1")"
	done
}
