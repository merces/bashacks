bh_bin2ip()
{
	local a=b=c=d=
	
	IFS=. read a b c d <<< "$1"								
	echo $((2#$a)).$((2#$b)).$((2#$c)).$((2#$d))
}