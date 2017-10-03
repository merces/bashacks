bh_user_path="$HOME/.config/bashacks"
bh_cache="$bh_user_path/cache/asm"

if which md5 >/dev/null; then # macOS
	alias bh_cmd_md5='md5'
	alias bh_cmd_sha1='shasum -a 1'
	alias bh_cmd_sha256='shasum -a 256'
	alias bh_cmd_sha512='shasum -a 512'
else # Linux
	alias bh_cmd_md5='md5sum'
	alias bh_cmd_sha1='sha1sum'
	alias bh_cmd_sha256='sha256sum'
	alias bh_cmd_sha512='sha512sum'
fi

alias bh_cmd_wget="wget -T10 -U \"Mozilla/5.0 (Windows NT 6.1; WOW64; rev:28.0) Gecko'20100101 Firefox/28.0\""
