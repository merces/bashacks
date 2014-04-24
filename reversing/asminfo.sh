asminfo()
{
    local USAGE="Prints on the screen the information assembly syntax\n
   asminfo <string>\n
   Category  : Reverse Engineering.\n
   Parameters:
        -h     :  Help.
        string : instruction to obtain information\n
   Output:
   \$ asminfo cmp
    ..."

    [ $# -lt 1 -o "$1" == '-h' ] && {
        echo -e "${USAGE}"
        return 1
    }

    local ins=${1,,}

    checkdir

    if test -s $hf_cache/$ins.txt; then
        cat $hf_cache/$ins.txt
	else
        wget -q faydoc.tripod.com/cpu/$ins.htm -O - |
        		 html2text |
        		 sed -n '/^===.*/,$p' |
        		 sed 's/^===.*/'${ins^^}'/' | tr _ ' ' |
        		 tee -a $hf_cache/$ins.txt
     fi

    test -s $hf_cache/$ins.txt || rm -f $hf_cache/$ins.txt

}