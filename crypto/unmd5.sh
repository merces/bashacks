unmd5()
{
   local USAGE="Attempts to discover the string that generated the MD5 hash using the internet (requires you to be connected).\n
   unmd5 <hash>\n
   Category  : Crypto.\n
   Parameters:
        -h   : Help.
        md5 hash to be broken.\n
    Output:
    \$ unmd5 827ccb0eea8a706c4c34a16891f84e7b 
    1234"

    [ $# -eq 0 -o "$1" == '-h' ] && { 
        echo -e "${USAGE}" 
        return 1
    }

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
