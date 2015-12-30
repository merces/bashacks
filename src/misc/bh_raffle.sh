bh_raffle()
{
	oIFS=$IFS
	IFS=$'\n'
	local i
	local interval=3
	test -n "$3" && interval=$3
	for i in $(seq $1 $2 | bh_cmd_random); do
		echo $i
		sleep $interval;
	done
	IFS=$oIFS
}
