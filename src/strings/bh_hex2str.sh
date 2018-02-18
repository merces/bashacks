bh_hex2str()
{
	[ $# -ne 1 ] && return 1 
	
	local hex
	local oIFS
	local i
	
	hex=$(echo "$1" | bh_cmd_sed_ext 's/(0x|\\x| |{\|}|,)//g')
	
	# insert a space each two chars
	hex=$(echo "$hex" | sed 's/../& /g')

	oIFS=$IFS
	IFS=' '
	for i in $hex; do
		echo -ne "\\x$i"
	done
	echo
	IFS=$oIFS
}
