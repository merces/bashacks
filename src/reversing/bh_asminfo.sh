bh_asminfo()
{
    [[ $# -lt 1 ]] && return 1 

    local ins=$1

    [[ -d $BASHACKS_CACHE ]] || mkdir -p $BASHACKS_CONFIG

    if [[ -s $BASHACKS_CONFIG/$ins.txt ]]; then
        cat $BASHACKS_CONFIG/$ins.txt
    else
        bh_cmd_wget -q faydoc.tripod.com/cpu/$ins.htm -O - \
         | html2text \
         | sed -n '/^===.*/,$p' \
         | sed 's/^===.*/'${ins}'/' \
         | tr _ ' ' \
         | tee -a $BASHACKS_CONFIG/$ins.txt
    fi

    [[ -s $BASHACKS_CONFIG/$ins.txt ]] || rm -f $BASHACKS_CONFIG/$ins.txt
}
