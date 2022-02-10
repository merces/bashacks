bh_bkp() {
	(( $# < 1 )) && return 1
	cp -vi "$1"{,.$(date +%Y%m%d)}
}