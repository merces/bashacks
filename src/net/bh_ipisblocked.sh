bh_ipisblocked() {
    (( $# < 1 )) && return 1

    local ipaddress="${1:-`bh_myip`}"
    local url_projects='TALOS;https://www.talosintelligence.com/documents/ip-blacklist
    Malc0de;http://malc0de.com/bl/IP_Blacklist.txt
    Projecthoneypot.org;https://www.projecthoneypot.org/list_of_ips.php
    blocklist.de;http://lists.blocklist.de/lists/all.txt
    Alienvault;https://reputation.alienvault.com/reputation.generic
    SANS-TOPSOURCE;https://isc.sans.edu/api/topsources?json'

    echo "== $ipaddress =="
    for project in $url_projects; do
        pjname="$(echo $project \
            | cut -d ';' -f1)"
        pjlink="$(echo $project \
            | cut -d ';' -f2)"

        if wget -T10 $pjlink -q -O - \
            | grep -Eo "([0-9]{1,3}\.){3}[0-9]{1,3}" \
            | grep -E ^$ipaddress$ > /dev/null 2>&1
        then
            echo -e "[T]\t$pjname" 
        else
            echo -e "[F]\t$pjname"
        fi
    done
}
