BASHACKS_CONFIG="$HOME/.config/bashacks"
BASHACKS_CACHEDIR="$BASHACKS_CONFIG/cache/asm"
BASHACKS_OS=$(uname -s)

if [[ $BASHACKS_OS = Darwin ]]; then
	alias bh_cmd_md5='md5'
	alias bh_cmd_sha1='shasum -a 1'
	alias bh_cmd_sha256='shasum -a 256'
else # BASHACKS=Linux
	alias bh_cmd_md5='md5sum'
	alias bh_cmd_sha1='sha1sum'
	alias bh_cmd_sha256='sha256sum'
fi

alias bh_cmd_wget="wget -T10 -U \"Mozilla/5.0 (Windows NT 6.1; WOW64; rev:28.0) Gecko'20100101 Firefox/28.0\""
alias bh_rot13='bh_rot 13'
