bh_zipmal() {
	(( $# < 1 )) && return 1
	
	local name=${1%\.*}.zip
	zip --encrypt -P infected "$name" $@
	ls -lh "$name"
}