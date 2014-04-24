rotall()
{
	local i

	test -n "$1" || { rot ; return 1; }

	for i in {1..25}; do
		echo "ROT$i $(rot $i "$1")"
	done
}

alias rot5='rot 5'
alias rot13='rot 13'
alias rot18='rot 18'
alias rot47='rot 47'