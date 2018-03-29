bh_ipinfo()
{
    local ipaddress="${1:-`bh_myip`}"
    local url="http://ipinfo.io"

    local company="$(bh_cmd_wget -qO - "$url/$ipaddress/org")" 
    local asreg="${company%% *}"

    echo "$company"
    
    [[ -n "$company" ]] && bh_cmd_wget -qO - "$url/$asreg" \
                                | grep "$asreg/" \
                                | sed 's/<[^>]*>//g; s/^ *//g'
}