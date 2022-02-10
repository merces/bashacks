bh_hex2str() {
	(( $# < 1 )) && return 1 
	
	local hex
	local i
	
	# remove non-hexa characters
	hex=$(echo "$1" | bh_cmd_sed_ext 's/(0x|\\x| |{|\||}|,)//g')

	# insert space every two characters
	hex=$(echo "$hex" | bh_cmd_sed_ext 's/../& /g')
	
	for i in $hex; do
		echo -ne "\\x$i"
	done
	echo
}