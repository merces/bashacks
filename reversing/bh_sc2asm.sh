bh_sc2asm()
{
    local mode=32
	local in="$1"

    [ $# -eq 0 ] && return 1

	[ $1 = '-m' ] && mode=$2 in="$3"

	sc=$(echo "$in" | sed 's/\\x/ /g')
	echo "$sc" | udcli -$mode -x -noff -nohex | sed 's/^ //'
}
