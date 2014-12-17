bh_unmd5()
{
    [ $# -eq 0 ] && return 1

    local sHash="$1"
    local sSite="http://www.md5online.org/"

    sA=$(wget -T 30 -q -O - "${sSite}" \
    --user-agent='Mozilla/5.0' |
    grep -Ewo 'hidden" name="a" value="[0-9]+' |
    grep -Ewo '[0-9]+')

    [ ! -z ${sA} ] && { 
        wget -q -T 30 -O - "${sSite}" \
        --user-agent='Mozilla/5.0' \
        --post-data="md5=${sHash}&search=0&action=decrypt&a=${sA}" |
        grep -Ewo 'Found : <b>.+</b>' |
        cut -d ':' -f2 |
        sed -r 's/<b>|<\/b>|^ //g'
    } || echo "variable 'a' not found"
}
