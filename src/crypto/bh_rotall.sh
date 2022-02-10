bh_rotall() {
	local i

	test -n "$1" || { bh_rot ; return 1; }

	for i in {1..25}; do
		echo "ROT$i $(bh_rot $i "$1")"
	done
}
