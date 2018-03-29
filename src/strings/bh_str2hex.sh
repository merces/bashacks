bh_str2hex() {
	[[ $# -eq 0 ]] && return 1

	# tr -d \\n is required by macOS and its sed version adds a newline to the end of output

	case "$1" in
		"-x")
			echo -n "$2" | hexdump -ve '/1 "%02x"' | sed 's/../\\x&/g' | tr -d \\n
			echo
			;;
		"-0x")
			echo -n "$2" | hexdump -ve '/1 "0x%02x "' | sed 's/\(.*\) /\1/' | tr -d \\n
			echo
			;;
		"-c")
			echo -n '{ '
			echo -n "$2" | hexdump -ve '/1 "0x%02x, "' | sed 's/\(.*\), /\1/' | tr -d \\n
			echo ' }'
			;;
        *)
			echo -n "$1" | hexdump -ve '/1 "%02x "' | sed 's/\(.*\) /\1/' | tr -d \\n
			echo
			;;
	esac
}