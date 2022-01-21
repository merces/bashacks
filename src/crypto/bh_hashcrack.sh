bh_hashcrack() {
    [[ $# -eq 0 ]] && return 1
    [[ -d "$BASHACKS_CACHEDIR" ]] || {
        mkdir -p "$BASHACKS_CACHEDIR" 
	>$BASHACKS_CACHEDIR/hash
    }
    
    local hash="$1"
    local site="https://hashtoolkit.com/decrypt-hash/?hash=$hash"

    # cache search
    CACHE=$(grep "$hash:" $BASHACKS_CACHEDIR/hash )
    [[ "$CACHE" ]] && {
         res=$(echo "$CACHE" \
	  | cut -d ':' -f2)
    } || {
      res=$(bh_cmd_wget -qO - "$site" \
       | grep '"decrypted' \
       | tr -d '[:blank:]' \
       | sed -e 's/<[^>]*>//g')
      #cache
      [[ "$res" ]] && echo "$hash:$res" >>$BASHACKS_CACHEDIR/hash
    }
    echo "$res"
}
