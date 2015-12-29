bh_myip()
{
    wget -q -T 10 'www.mentebinaria.com.br/ext/ip.php' -O -
    echo
}
