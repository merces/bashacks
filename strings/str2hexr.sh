str2hexr()
{
    local USAGE="Converts string in byte hex equivalent to each char (hex string) and inverted output.\n
        str2hexr <Parameter> <string>\n
        Category  : Char and String\n
        Parameters:
            -x  :    Output bytes spaced and not prefixed with '\x'.
            -0x :    Output bytes spaced and prefixed with '0x'.
            -c  :    Bytes array in C language style.
            -s  :    Output bytes not spaced and inital prefixed '0x'.
            -h  :    Help.\n
            string : the string to be converted.\n
        Output:
        \$ str2hexr 'Fernando'
        6f 64 6e 61 6e 72 65 46
        \$ str2hexr -x 'Fernando'
        \x6f\\x64\\x6e\\x61\\x6e\\x72\\x65\\x46
        \$ str2hexr -0x 'Fernado'
        0x6f 0x64 0x6e 0x61 0x6e 0x72 0x65 0x46
        \$ str2hexr -s 'Fernando'
        0x6f646e616e726546"

    [ $# -eq 0 -o "$1" == '-h' ] && { 
        echo -e "${USAGE}"
        return 1
    }

    case "$1" in
	    "-x" | "-0x" | "-c" | "-s")
	        str2hex $1 "$(echo "$2" | rev)"
		;;
        "-h")
            echo -e "${USAGE}"
        ;;
        *)
		    str2hex "$(echo "$1" | rev)"
	    ;;
	esac
}