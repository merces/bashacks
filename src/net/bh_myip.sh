bh_myip() {
	local ip=
	ip=$(bh_cmd_wget -q https://www.mentebinaria.com.br/ext/ip.php -O -)
	[[ $ip =~ [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3} ]] || ip=$(bh_cmd_wget -q https://api.ipify.org -O -)
	[[ $ip =~ [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3} ]] && echo $ip
}