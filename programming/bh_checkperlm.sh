bh_check_perlm(){
	[ $# -ne 1 ] && return 1
	perl -M"$1" -e exit &> /dev/null && echo yes ||
	echo no
}
