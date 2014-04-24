asm2sc()
{
    local USAGE="Generates shellcode based on asm file.\n
   asm2sc -f elf32 asmfile\n
   Category  : Reverse Engineering.\n
   Parameters:
        -f     : followed by architecture and asm file [-f elf32 hello.s]
        -h     : Help.
   Output:
   \$ asm2sc fork.s
   \\\x31\\\xc0\\\x40\\\x40\\\xcd\\\x80\\\xeb\\\xf8
    "

	local obj=$(mktemp)
	local fmt=elf32
	local in="$1"

    [ $#  -eq 0 -o \
        "$1" = '-h' ] && {
        echo -e "${USAGE}"
        return 1
    }

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