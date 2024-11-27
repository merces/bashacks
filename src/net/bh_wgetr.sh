bh_wgetr() {
	(( $# < 1 )) && return 1
	
	wget -crw 2 --random-wait -U "$bashacks_wget_user_agent" "$1"
}