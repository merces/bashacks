bh_wgetr()
{
	[ $# -eq 1 ] || return 1

	bh_cmd_wget -crw $((($RANDOM%10)+1)) "$1"
}
