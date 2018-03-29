bh_wgetr() {
	[[ "$1" ]] || return
	wget -crw $((($RANDOM%10)+1)) -U "$BASHACKS_WGET_USER_AGENT" "$1"
}