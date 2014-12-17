bh_asm2sc()
{
	local obj=$(mktemp)
	local fmt=elf32
	local in="$1"

    [ $#  -eq 0 ] && return 1

    [ $1 = "-f" ] && fmt=$2 in="$3"

	nasm -f $fmt -o $obj $in

	objdump -M intel -D $obj |
	 tr -d \\t |
	 sed -nr 's/^.*:(([0-9a-f]{2} )*).*$/\1/p' | 
	 tr -d \\n |
	 sed 's/\(..\) /\\x\1/g'

    echo
	rm -f $obj
}
