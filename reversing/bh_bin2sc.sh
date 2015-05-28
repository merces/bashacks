bh_bin2sc()
{
	[ $# -ne 1 ] && return 1
	objdump -D "$1" | perl -ne 's/\b([a-f0-9]{2})\b/print "\\x".$1/ge'
	echo
}
