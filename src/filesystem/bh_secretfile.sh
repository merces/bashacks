bh_secretfile(){
	(( $# != 1 )) && return 1
	local pw=$(tr -dc "a-zA-Z0-9_#@.-" < /dev/urandom | head -c 20)
	local filename=$RANDOM.zip
	zip -P "$pw" "$filename" "$1"
	bh_sharefile "$filename"
	echo "$pw"
	rm -f "$filename"
}
