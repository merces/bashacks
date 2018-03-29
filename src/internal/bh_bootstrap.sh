BASHACKS_CONFIG="$HOME/.config/bashacks"
BASHACKS_CACHEDIR="$BASHACKS_CONFIG/cache/asm"
BASHACKS_OS=$(uname -s)
BASHACKS_WGET_USER_AGENT="Mozilla/5.0 (Windows NT 6.1; WOW64; rev:28.0) Gecko'20100101 Firefox/28.0"

if [[ $BASHACKS_OS = 'Darwin' ]]; then
	alias bh_cmd_md5='md5 -r'
	alias bh_cmd_sha1='shasum -a 1'
	alias bh_cmd_sha256='shasum -a 256'
	alias bh_cmd_sha512='shasum -a 512'
	alias bh_cmd_disasm='objdump -d -x86-asm-syntax=intel'
	alias bh_cmd_sed_ext='sed -E'
else # Linux
	alias bh_cmd_md5='md5sum'
	alias bh_cmd_sha1='sha1sum'
	alias bh_cmd_sha256='sha256sum'
	alias bh_cmd_sha512='sha512sum'
	alias bh_cmd_disasm='objdump -dM intel'
	alias bh_cmd_sed_ext='sed -r'
fi

alias bh_cmd_wget="wget -T10 -U \"$BASHACKS_WGET_USER_AGENT\""
alias bh_rot13='bh_rot 13'