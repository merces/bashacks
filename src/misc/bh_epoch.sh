bh_epoch() {
	(( $# == 0 )) && ( date +%s; return; )

	if [[ $1 =~ ^[0-9]+$ ]]; then
		[[ $BASHACKS_OS == Darwin ]] && date -ur $1 || date -d @$1
	fi
}