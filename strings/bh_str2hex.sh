bh_str2hex()
{
    local USAGE="Converts string in hex byte equivalent to each char (hex string).\n
        bh_str2hex <Parameter> <string>\n
        Category  : Char and String\n
        Parameters:
            -x  :    Output bytes spaced and not prefixed with '\x'.
            -0x :    Output bytes spaced and prefixed with '0x'.
            -c  :    Bytes array in C language style.
            -s  :    Output bytes not spaced and inital prefixed '0x'.
            -h  :    Help.\n
            string : converting string\n
        Output:
        \$ bh_str2hex 'Fernando'
        46 65 72 6e 61 6e 64 6f
        \$ bh_str2hex -x 'Fernando'
        \\\x46\\\x65\\\x72\\\x6e\\\x61\\\x6e\\\x64\\\x6f
        \$ bh_str2hex -0x 'Fernado'
        0x46 0x65 0x72 0x6e 0x61 0x6e 0x64 0x6f
        \$ bh_str2hex -s 'Fernando'
        0x4665726e616e646f"

    [ $# -eq 0 -o "$1" == '-h' ] && {
        echo -e "${USAGE}"
        return 1
    }

	case "$1" in
		"-s") 
			echo -n "$2" | hexdump -ve '/1 "%02x"' | sed 's/^/0x/' 
			echo
			;;
		"-x")
			echo -n "$2" | hexdump -ve '/1 "%02x"' | sed 's/../\\x&/g'
			echo
			;;
		"-0x")
			echo -n "$2" | hexdump -ve '/1 "0x%02x "' | sed 's/\(.*\) /\1/'
			echo
			;;
		"-c")
			echo -n '{'
			echo -n "$2" | hexdump -ve '/1 "0x%02x, "' | sed 's/\(.*\), /\1/'
			echo '}'
			;;
        "-h")
            echo -e "${USAGE}"
            ;;
        *)
			echo -n "$1" | hexdump -ve '/1 "%02x "' | sed 's/\(.*\) /\1/'
			echo
			;;
	esac
}
