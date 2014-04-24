asmgrep()
{
    local USAGE="Search assembly instructions into executable binaries and 
prints 4 instructions 'round'. You must be attentive to the syntax 
(Intel or AT&T) utilized in your environment..\n
   asmgrep <regex> <file>\n
   Category  : Reverse Engineering.\n
   Parameters:
        -h      : Help.
        regex   : Regular expression
        file    : File to store data.\n
   Output:
   \$ asmgrep 'push.*rbp$' /bin/ls
   411400:  41 57                          push r15
   411402:  41 56                          push r14
   411404:  41 55                          push r13
   411406:  41 54                          push r12
   411408:  55                             push rbp
   411409:  53                             push rbx
   41140a:  48 83 ec 68                    sub rsp,0x68
   41140e:  85 ff                          test edi,edi
   411410:  48 8b 9c 24 a0 00 00           mov rbx,QWORD PTR [rsp+0xa0]" 

    [ $# -lt 2 -o "$1" == '-h' ] && {
        echo -e "${USAGE}"
        return 1
    }

    objdump -d "$2" | grep --color -C 4 -E "$1"

}