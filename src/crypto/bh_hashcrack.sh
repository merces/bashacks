bh_hashcrack() {
    [ $# -eq 0 ] && return 1

    local hash="$1"
    local site="https://hashtoolkit.com/decrypt-hash/?hash=$hash"

    res=$(bh_cmd_wget -qO - "$site" \
	  | sed -n '/.*generate-hash\/?text=\(.*\)\".*/{s//\1/p;q;}')

    [ "$res" != "$hash" ] && echo "$res"
}
