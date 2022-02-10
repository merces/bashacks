bh_rot() {
	local n

	[ $# -eq 2 ] || return 1

	# n receives the correspondent alphabet letter
	n=$(echo -e \\x$(bh_dec2hex $(( 97 + $1 )) ) )

	# bash idiom to turn our text in uppercase letters
	N="${n^^}"

	# rot with tr command
	echo $2 | tr a-z $n-za-z | tr A-Z $N-ZA-Z
}
