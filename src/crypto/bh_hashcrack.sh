bh_hashcrack() {
    [[ $# -eq 0 ]] && return 1

    local hash="$1"
    local site="http://hashtoolkit.com/reverse-hash/?hash=$hash"

    res=$(bh_cmd_wget -qO - "$site" \
     | grep -FA1 'res-text' \
     | sed -n 's/^.*<span>\(.*\)<\/span>.*$/\1/p')

    [[ "$res" != "$hash" ]] && echo "$res" | sort -u
}
