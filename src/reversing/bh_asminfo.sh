bh_asminfo() {
    (( $# < 1 )) && return 1

    local ins=$1

    [[ -d $bashacks_cachedir ]] || mkdir -p $bashacks_cachedir

    if [[ -s $bashacks_cachedir/$ins.txt ]]; then
        cat $bashacks_cachedir/$ins.txt
    else
        wget -T10 -U "${bashacks_wget_user_agent}" \
         -q https://faydoc.tripod.com/cpu/$ins.htm -O - \
         | html2text \
         | sed -n '/^===.*/,$p' \
         | sed 's/^===.*/'${ins}'/;s/_/ /g' \
         | tee -a $bashacks_cachedir/$ins.txt
    fi
}
