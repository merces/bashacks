bh_keycheck()
{
	diff <(ssh-keygen -y -f "$1") <(cut -d' ' -f1,2 "$2") >/dev/null && echo \
	'keys match!' || echo 'keys does not match! :('
}
