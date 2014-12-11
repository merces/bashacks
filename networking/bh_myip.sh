bh_myip()
{
    [ "$1" == '-h' ] && return 1 

    wget -q -T 10 'www.mentebinaria.com.br/ext/ip.php' -O -
    echo
}
