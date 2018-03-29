bh_rot()
{
	local n=

	[[ $# -eq 2 ]] || return 1 

	# n receives the correspondent alphabet letter
	n=$(echo -e \\x$(bh_dec2hex $(echo -e $((97+$1)))))
	N=$(echo $n | tr a-z A-Z)

	# rot with tr command
	echo $2 | tr a-z $n-za-z | tr A-Z $N-ZA-Z
}