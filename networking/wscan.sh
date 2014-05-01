wscan()
{
    local USAGE="Displays the list of wireless networks with chanell, bss, signal, ssid and others\n
   wscan <-mac MACADDRES |-oui|-oui OUI>\n
   Category  : Networking.\n
   Parameters:
        -i  : dev wifi
        -oui: oui 00:e0:4c return vendor or available list 'oui'
        -mac: mac address 9c:97:26:67:f0:4b, return product company, required connected
        -h  : Help
        root is required\n
   Output:
   # wscan
    6	f8:1a:67:c2:be:0a	: -55.00	: Hunter
    10	9c:97:26:67:f0:4b	: -87.00	: WiFi Fon
    11	00:1a:3f:83:01:df	: -86.00	: ZUDICA\n
   # wscan -mac f8:1a:67:c2:be:0a
   TP-LINK TECHNOLOGIES CO., LTD.
   # wscan -oui 
    BSS 00:1e:58:c4:e9:63 (on wlan0)
	    SSID: Barack
	    Vendor specific: OUI 00:03:7f, data: 01 01 00 20 ff 7f
		    * Model: DIR-300
    BSS 14:d6:4d:72:66:d4 (on wlan0)
	    SSID: 
	    Vendor specific: OUI 00:0c:43, data: 00 00 00 00
   # wscan -oui 00:03:7f
    ===============================================================================
    00-03-7F   (hex)		Atheros Communications, Inc.
    00037F     (base 16)	Atheros Communications, Inc.
                                5480 Great America Parkway
                                Santa Clara CA 95054
                                UNITED STATES\n"
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
        "$1" == '-h' -o \
        -z "${iFace}" ] && {
        echo -e "${USAGE}"
        return 1
    }


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
