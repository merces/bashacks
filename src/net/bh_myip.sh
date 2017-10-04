bh_myip()
{
    bh_cmd_wget -q www.mentebinaria.com.br/ext/ip.php -O -
    echo
}
