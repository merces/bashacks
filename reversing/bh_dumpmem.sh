bh_dumpmem()
{
    [ $# -le 1 -o "${EUID}" -ne 0 ] && return 1
 
    local stack_addr=$(grep -m 1 "$1" /proc/$2/maps |
	            cut -d' ' -f1 | sed 's/^/0x/; s/-/ 0x/')

	test -n "$stack_addr" && \
	        echo "dump memory "$3" $stack_addr" | gdb --pid $2 &> /dev/null
}

alias bh_dumpstack='bh_dumpmem stack'
alias bh_dumpheap='bh_dumpmem heap'
