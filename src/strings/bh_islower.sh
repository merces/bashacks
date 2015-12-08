bh_islower()
{
   [ $# -eq 0 ] && return 1
    
   echo "$1" | grep -Eqw '^[a-z]+$'
}
