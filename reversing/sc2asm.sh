sc2asm()
{
    local USAGE="Asm code generated through a shellcode.\n
   sc2asm -m 32 shellcode\n
   Category  : Reverse Engineering.\n
   Parameters:
        -m     : followed by architecture and string shellcode
        -h     : Help.
   Output:
   \$ sc2asm '\\\x31\\\xc0\\\x40\\\x40\\\xcd\\\x80\\\xeb\\\xf8'
   xor eax, eax
   inc eax
   inc eax
   int 0x80
   jmp 0x0\n"

    local mode=32
	local in="$1"

    [ $# -eq 0 -o \
        "$1" = '-h' ] && {
        echo -e "${USAGE}"
        return 1
    }

	[ $1 = '-m' ] && mode=$2 in="$3"

	sc=$(echo "$in" | sed 's/\\x/ /g')
	echo "$sc" | udcli -$mode -x -noff -nohex | sed 's/^ //'
}