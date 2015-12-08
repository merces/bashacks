bh_charcalc()
{
    [ $# -ne 3 ] && return 1

    local char
    local chars
    local res
    local i

    case $2 in
        +|-)
            for i in $(echo "$1" | sed 's/./& /g'); do
        		char=$(bh_asc2dec $i)
        		res=$(($char $2 $3))
            		echo -n $(bh_dec2asc $res)
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
