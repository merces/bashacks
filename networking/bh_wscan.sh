bh_wscan()
{
    local iFace
    local OUI
    local MAC
    local MACTMP
    local MACPROD

    [ "$1" == "-i" ] && iFace=$2 || {
        local iFace="$(iw dev |
        grep 'Interface' |
        cut -d' ' -f2)"
    }

    [ ${EUID} -ne 0 -o \
        -z "${iFace}" ] && return 1

    case "$1" in
        -oui)
            [ ! -z "$(echo $2 | grep -Ewo '(([0-9a-f]){2}:){2}([0-9a-f]){2}' )" ] && {

                OUI=$( echo $2 | tr ':' '-' )
                wget 'http://standards.ieee.org/cgi-bin/ouisearch' \
                    --post-data="x=${OUI}&submit2=search%21" --no-verbose -O - |
                sed '/<pre>/,/<\/pre>/ s/^/--/g' | 
                grep '^--' |
                sed 's/^--//g' |
                html2text
            } || {
                iw ${iFace} scan -u | 
                grep -E '^BSS|SSID|OUI|Model:' 
            }
        ;;
        -mac)
            [ ! -z "$(echo $2 | grep -Ewo '(([0-9a-fA-F]){2}:){5}([0-9a-fA-F]){2}' )" ] && {
                MACTMP=$(mktemp)
                MAC="$2"
                wget "http://www.macvendorlookup.com/ouisearch?mac=${MAC}" -O - &> ${MACTMP}
                MACPROD="$(cat ${MACTMP} | tr \: \\n |
                grep -A 1 -i 'company' |
                tail -1 |
                cut -d\" -f2)"

                [ -z "${MACPROD}" ] && echo "No Vendor Exists" ||
                    echo "${MACPROD}"

                rm ${MACTMP}
            }
        ;;
        *)
            iw ${iFace} scan |
            grep -E '^BSS|signal|SSID|: channel ([0-9]){1,2}' |
            sed -r 's/dBm|signal|SSID|\-\- associated|DS Parameter set|channel//g' |
            tr \\n ' ' | sed 's/BSS/\n/g' |
            sed "s/(on ${iFace})//" |
            awk '{print $NF,'\t',$0 }' |
            sed -r 's/:  ([0-9]){1,2}//g; s/([\ |\t]){2,}/_/g; s/_/\t/g'
            echo
        ;;
    esac
}
