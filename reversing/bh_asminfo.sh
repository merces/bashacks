bh_asminfo()
{
    local USAGE="Prints on the screen the information assembly syntax\n
   bh_asminfo <string>\n
   Category  : Reverse Engineering.\n
   Parameters:
        -h     :  Help.
        string : instruction to obtain information\n
   Output:
   \$ bh_asminfo cmp
    ..."

    [ $# -lt 1 -o "$1" == '-h' ] && {
        echo -e "${USAGE}"
        return 1
    }

    local ins=${1,,}

    bh_checkdir

    if test -s $bh_cache/$ins.txt; then
        cat $bh_cache/$ins.txt
	else
        wget -q faydoc.tripod.com/cpu/$ins.htm -O - |
        		 html2text |
        		 sed -n '/^===.*/,$p' |
        		 sed 's/^===.*/'${ins^^}'/' | tr _ ' ' |
        		 tee -a $bh_cache/$ins.txt
     fi

    test -s $bh_cache/$ins.txt || rm -f $bh_cache/$ins.txt

}
