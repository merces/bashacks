bh_zerostring() {
	[[ -f "$1" && -n "$2" ]] || return 1

	local fil="$1"
	local search="$2"

	# 'tr' is needed here because strings command outputs lines
	# starting with two space characters in some systems
	local pos=$(strings -t d "$fil" | grep -F "$search" | tr -s ' ' ' ' | cut -d' ' -f2)

	siz=${#search}
	for i in $pos; do
		[[ $i -gt 0 ]] || continue
		dd conv=notrunc bs=1 count=$siz seek=$i if=/dev/zero of="$fil"
	done
}