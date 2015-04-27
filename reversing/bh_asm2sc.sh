bh_asm2sc()
{
	local obj=$(mktemp)
	local fmt=elf32
	local in="$1"

    [ $#  -eq 0 ] && return 1

    [ $1 = "-f" ] && fmt=$2 in="$3"

	nasm -f $fmt -o $obj $in

	objdump -D $obj | perl -ne's/\b([a-f0-9]{2})\b/print "\\x".$1/ge'
	echo

	rm -f $obj
}
