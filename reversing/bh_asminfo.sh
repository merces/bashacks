bh_asminfo()
{
    [ $# -lt 1 ] && return 1 

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
