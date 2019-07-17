bh_sharefile() {
	[[ -n "$1" ]] || return 1
	
	curl -sF "file=@$1" https://file.io | grep -o 'https://file\.io/[a-zA-Z0-9]*'
}