bh_epoch() {
	(( $# == 0 )) && ( date +%s; return; )

	if [[ $1 =~ ^[0-9]+$ ]]; then
		[[ $bashacks_os == Darwin ]] && date -ur $1 || date -d @$1
	fi
}
