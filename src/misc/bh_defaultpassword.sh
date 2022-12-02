bh_defaultpassword() {
	(( $# < 1 )) && return 1
	local modelo="$1"
	local URL="https://cirt.net/passwords?criteria=$modelo"
	local HTML

	HTML="$(bh_cmd_wget -qO - $URL)" 
	echo -b "$HTML" \
		| sed '/table/,/\/table>/s/^/--/' \
		| grep '^--' \
		| sed 's/^--//g' \
		| html2text
}
