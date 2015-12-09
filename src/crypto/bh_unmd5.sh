bh_unmd5()
{
    [ $# -eq 0 ] && return 1

    local sHash="$1"
    local sSite="http://hashtoolkit.com/reverse-hash/?hash=$sHash"

    sA=$(wget -T 30 -q -O - "$sSite" --user-agent="Mozilla/5.0 (Windows NT 6.1; WOW64; rev:28.0) Gecko'20100101 Firefox/28.0" |
        grep -A 1 'res-text' |
        tail -1 |
        sed -e 's/[ ]\+//g ;s/<[^>]*>//g')

    [ ! -z "$sA" ] && [ "$sA" != "$sHash" ] &&
        echo "${sA}"
}

alias bh_unsha512="bh_unmd5"
alias bh_unsha1="bh_unmd5"
alias bh_unsha256="bh_unmd5"
alias bh_unsha356="bh_unmd5"

