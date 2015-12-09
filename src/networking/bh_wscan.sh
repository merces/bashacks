bh_wscan()
{
    local iface
    local param

    [ $EUID -ne 0 ] && 
        { echo 'root is required' ; return 1; }

    [ "$1" == '-i' ] && { 
        iface="$2" 
        param="$3"
    } || {
        iface=$( iw dev | 
		grep 'Interface' \
            	| cut -d' ' -f2 )
        param="$1"
    }

    [ -z "$iface" ] &&
        { echo 'wireless interface not found' ; return 1; }

    case "$param" in
        -model)
            iw "$iface" scan -u \
                | grep -E '^BSS|Model:' \
                | sed -r 's/(\(.*\)|-- associated)//g' \
                | tr \\n ' ' \
                | sed 's/BSS/\n/g' \
                | grep 'Model' \
                | sed 's/Model: //g' 
        ;;
        -wps)
            iw "$iface" scan\
                | grep -E '^BSS|WPS|: channel ([0-9]){1,2}' \
                | sed -e 's/: chanell//' \
                | tr \\n ' ' \
                | sed -re "s/BSS/\n/g; \
                    s/(\(on $iface\)|DS Parameter set: channel|\* Version: |-- associated|:\t)//g" \
                | grep 'WPS' 
        ;;
        *)
            iw "$iface" scan\
                | grep -E '^BSS|signal|SSID|: channel ([0-9]){1,2}' \
                | sed -r 's/dBm|signal|SSID|\-\- associated|DS Parameter set|channel//g' \
                | tr \\n ' ' | sed 's/BSS/\n/g' \
                | sed "s/(on \"$iface\")//" \
                | awk '{print $NF,'\t',$0 }' \
                | sed -r 's/:  ([0-9]){1,2}//g; s/([\ |\t]){2,}/_/g; s/_/\t/g'
                echo
        ;;
    esac
}
