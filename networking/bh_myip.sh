bh_myip()
{
    local USAGE="Displays the real ip address of your connection.\n
   bh_myip\n
   Category  : Networking.\n
   Parameters:
        -h  : Help\n
   Output:
   \$ bh_myip
   1.2.3.4"

    [ "$1" == '-h' ] && {
        echo -e "${USAGE}"
        return 1
    }

    wget -q -T 10 'www.mentebinaria.com.br/ext/ip.php' -O -
    echo
}
