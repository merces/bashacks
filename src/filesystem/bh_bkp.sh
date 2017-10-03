bh_bkp()
{ 
	cp -vi "$1"{,.$(date +%Y%m%d)}; 
}
