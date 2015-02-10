bh_isspace() 
{
    local str="$(echo $1 |
        hexdump -ve '/1 "%02x"'|
        sed 's/../x& /g' )"
    for h in $str;
    do
        case $h in
            x09|x0a|x0b|x0c|x0d|x20) return 0
                ;;
            *) return 1
                ;;
        esac
    done
}
