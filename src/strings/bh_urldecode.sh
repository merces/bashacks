bh_urldecode(){
	[ $# -ne 1 ] && return 1
	echo "$1" | perl -pe 's/%([0-9a-f]{2})/pack "H*", $1/gie'
}

