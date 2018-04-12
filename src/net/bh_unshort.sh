bh_unshort() {
	bh_cmd_wget --max-redirect 0 "$1" 2>&1 | grep -F Location: | cut -d' ' -f2
}