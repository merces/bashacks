bh_hashcrack()
{
    [ $# -eq 0 ] && return 1

    local sHash="$1"
    local sSite="http://hashtoolkit.com/reverse-hash/?hash=$sHash"

    sA=$(bh_cmd_wget -qO - "$sSite" \
     | grep -FA1 'res-text' \
     | sed -n 's/^.*<span>\(.*\)<\/span>.*$/\1/p')

    [[ "$sA" != "$sHash" ]] && echo "${sA}"
}
