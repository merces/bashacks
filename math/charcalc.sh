charcalc()
{
   local USAGE="Carries out calculations between special characters and numbers.\n
   charcalc <char> <operator> <number>\n
   Category  : Char and String.\n
   Parameters:
        -h        : Help
        char      : Any one character or a string when multiplication operation.
        operator  : +,- or *
        number    : One number.\n
   Output:
   \$ charcalc f + 2
    h
   \$ charcalc B - 1
    A
   \$ charcalc A \\* 16
    AAAAAAAAAAAAAAAA
   \$ charcalc isso \\* 3
    issoissoisso"

    [ $# -ne 3 -o "$1" == '-h' ] && {
        echo -e "${USAGE}" 
        return 1
    }

    local char
    local chars
    local res
    local i

    case $2 in
        +|-)
            for i in $(echo "$1" | sed 's/./& /g'); do
        		char=$(asc2dec $i)
        		res=$(($char $2 $3))
            		echo -n $(dec2asc $res)
		done
		echo
   		;;
   		'*')
 		    for (( i=0; i<$3; i++ )); do
        	    res="$res$1"
        	done
            echo $res
    	;;
    esac

}