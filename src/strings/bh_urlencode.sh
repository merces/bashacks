bh_urlencode() {
	(( $# < 1 )) && return 1
	echo -ne "$1" | perl -pe 's/\W/"%".unpack "H*",$&/gei'
	echo
}