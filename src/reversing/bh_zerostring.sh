bh_zerostring() {
	[[ -f "$1" && -n "$2" ]] || return 1

	local fil="$1"
	local search="$2"

	# 'tr' is needed here because the strings command
    # might output lines starting with two spaces
	local pos=$(strings -t d "$fil" | grep -F "$search" | tr -s ' ' ' ' | cut -d' ' -f1)

	local siz=${#search}
	for i in $pos; do
		dd conv=notrunc bs=1 count=$siz seek=$i if=/dev/zero of="$fil"
	done
}
