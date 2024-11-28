bh_replacestring() {
    [[ -f "$1" && -n "$2" && -n "$3" && "${#2}" == "${#3}" ]] || return 1

    local fil="$1"
    local src="$2"
    local dst="$3"

    local srchex=$(echo "$src" | xxd -pu)
    local dsthex=$(echo "$dst" | xxd -pu)

    local tmpfile=$(mktemp)

    xxd -p $fil | tr -d \\n | sed "s/${srchex::-2}/${dsthex::-2}/g" | xxd -rp >  $tmpfile
    
    [[ -s $tmpfile ]] && mv $tmpfile $fil
}
