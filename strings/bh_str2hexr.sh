bh_str2hexr()
{
    [ $# -eq 0 ] && return 1

    case "$1" in
	    "-x" | "-0x" | "-c" | "-s")
	        bh_str2hex $1 "$(echo "$2" | rev)"
		;;
        *)
		    bh_str2hex "$(echo "$1" | rev)"
	    ;;
	esac
}
