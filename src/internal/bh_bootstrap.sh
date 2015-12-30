bh_user_path="$HOME/.config/bashacks"
bh_cache="$bh_user_path/cache/asm"

if which shasum >/dev/null; then # OS X
	which md5 >/dev/null && alias bh_cmd_md5='md5'
	alias bh_cmd_sha1='shasum -a 1'
	alias bh_cmd_sha256='shasum -a 256'
	alias bh_cmd_sha512='shasum -a 512'
	gshuf <<< 1 >/dev/null && alias bh_cmd_random='gshuf'
else # Linux
	which md5sum >/dev/null && alias bh_cmd_md5='md5sum'
	which sha1sum >/dev/null && alias bh_cmd_sha1='sha1sum'
	which sha256sum >/dev/null && alias bh_cmd_sha256='sha256sum'
	which sha512sum >/dev/null && alias bh_cmd_sha512='sha512sum'
	shuf <<< 1 >/dev/null && alias bh_cmd_random='shuf'
fi

alias bh_cmd_wget="wget -T10 -U \"Mozilla/5.0 (Windows NT 6.1; WOW64; rev:28.0) Gecko'20100101 Firefox/28.0\""