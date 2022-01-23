bh_wgetr() {
	[[ "$1" ]] || return 1
	wget -crw 2 --random-wait -U "$BASHACKS_WGET_USER_AGENT" "$1"
}