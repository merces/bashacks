bh_isprint()
{
	# nao ta rolando
	local i

	for i in $(bh_str2hex -0x "$1" | sed 's/\(....\)/\1 /g'); do
		[ $(($i)) -ge 32 -a $(($i)) -le 127 ] || return 1
	done
	return 0
}
