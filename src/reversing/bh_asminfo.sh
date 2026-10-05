# bh_asminfo lea
bh_asminfo() {
    (( $# < 1 )) && return 1

    local ins=$1

    [[ -d $bashacks_cachedir ]] || mkdir -p $bashacks_cachedir

    if [[ -s $bashacks_cachedir/$ins.txt ]]; then
        cat $bashacks_cachedir/$ins.txt
    else
        wget -T10 -qU "${bashacks_wget_user_agent}" \
         https://www.felixcloutier.com/x86/$ins -O- \
         | html2text \
         | tee -a $bashacks_cachedir/$ins.txt
    fi
}
