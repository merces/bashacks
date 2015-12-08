bh_rotall()
{
	local i

	test -n "$1" || { bh_rot ; return 1; }

	for i in {1..25}; do
		echo "ROT$i $(bh_rot $i "$1")"
	done
}

alias bh_rot5='bh_rot 5'
alias bh_rot13='bh_rot 13'
alias bh_rot18='bh_rot 18'
alias bh_rot47='bh_rot 47'
