bh_asminfo() {
    (( $# < 1 )) && return 1

    local ins=$1

    [[ -d $BASHACKS_CACHEDIR ]] || mkdir -p $BASHACKS_CACHEDIR

    if [[ -s $BASHACKS_CACHEDIR/$ins.txt ]]; then
        cat $BASHACKS_CACHEDIR/$ins.txt
    else
        bh_cmd_wget -q faydoc.tripod.com/cpu/$ins.htm -O - \
         | html2text \
         | sed -n '/^===.*/,$p' \
         | sed 's/^===.*/'${ins}'/' \
         | tr _ ' ' \
         | tee -a $BASHACKS_CACHEDIR/$ins.txt
    fi
}
