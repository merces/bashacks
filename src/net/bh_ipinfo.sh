bh_ipinfo()
{
    local ipaddress="${1:-`bh_myip`}"
    local url="http://ipinfo.io"

    wget -qO - "$url/$ipaddress"
}
