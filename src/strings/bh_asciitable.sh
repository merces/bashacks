bh_asciitable() {
	# entire manual
	ascii_man=$(man ascii)

	# getting the last table line
	# \077 = 63
	last_line=$(grep -n "077" <<< "$ascii_man" | cut -d ':' -f '1')

	# showing range of rows	containing ascii table
	# why 66? r: len(table) = 63 + table title + space
	sed "$(( last_line - 66 )),$last_line"'!d; s/^ \{7\}//g; /^$/d' \
		<<< "$ascii_man"
}
