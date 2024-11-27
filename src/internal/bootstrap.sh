#!/bin/bash

bashacks_config="$HOME/.config/bashacks"
bashacks_cachedir="$bashacks_config/cache"
bashacks_os=$(uname -s)
bashacks_wget_user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246"

if [[ $bashacks_os = 'Darwin' ]]; then
	alias bh_cmd_md5='md5 -r'
	alias bh_cmd_sha1='shasum'
	alias bh_cmd_sha256='shasum -a256'
	alias bh_cmd_sha512='shasum -a512'
	alias bh_cmd_disasm='objdump -d --x86-asm-syntax=intel'
	alias bh_cmd_sed_ext='sed -E'
else # assume Linux
	alias bh_cmd_md5='md5sum'
	alias bh_cmd_sha1='sha1sum'
	alias bh_cmd_sha256='sha256sum'
	alias bh_cmd_sha512='sha512sum'
	alias bh_cmd_disasm='objdump -dM intel'
	alias bh_cmd_sed_ext='sed -r'
fi

alias bh_rot13='bh_rot 13'

