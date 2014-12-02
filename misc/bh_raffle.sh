bh_raffle()
{
	local i
	local interval=3
	test -n "$3" && interval=$3
	for i in $(seq $1 $2 | sort -R); do
		echo $i
		sleep $interval;
	done
}
