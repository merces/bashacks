bh_myip() {
	local ip=$(wget -q https://api.ipify.org -O -)
	[[ $ip =~ [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3} ]] && echo $ip
}