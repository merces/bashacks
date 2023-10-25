# bashacks

## What?

bashacks started as a collection of bash functions most likely useful for programmers, security analysts, and general users that need some low level type of operations.

In fact, there is nothing really new in bashacks as all functions are written using exiting software in UNIX-like systems. However, it allows you to use shorter commands to run tasks that commonly would require many a few more lines of code.

## Requirements

* bash >= 4
* bc
* binutils
* coreutils
* curl
* file
* grep
* hexdump
* html2text
* perl
* sed
* wget
* xxd
* zip

## Installation

Use the *make* command to generate a single file containing all functions and add it to your ```/etc/bash.bashrc``` file:

    make
    make install

 That's all. You can now check the available functions from command line by typing *bh_* and pressing TAB.

## Documentation

Click [here](https://bashacks.readthedocs.io/). 

## Usage

What time is now in Epoch?

    $ bh_epoch
    1522324129

Alphabetically add 4 to 'f'

    $ bh_charcalc f + 4
    j

Check external IP address

    $ bh_myip
    177.212.113.13

Create a basic C program skeleton

    $ bh_skel_c > hello.c
    $ cat hello.c
    #include <stdio.h>

    int main(int argc, char *argv[]) {


        return 0;
    }

Calculate common checksums for files

    $ bh_hashes /bin/ip*
    387478f58a0669173fb6557d392a58e9 /bin/ip
    1dd0f3b100bd6efc4664da0cdefff801d7d2efd8 /bin/ip
    1d418ae3a767280c7fc6026a25e5bb9774c0e8afc7b3387b547765b62cbe578f /bin/ip
    78868acd29e4a33194fb786f6589d3d1 /bin/ipcmk
    8c22a129ff4b5748cc62222a93ba8471d7fdce19 /bin/ipcmk
    34a068d7f85e85746b3fc98502fa96a734cc51f3a9d49cad92911e8f239bd9c9 /bin/ipcmk
    69c2bedc20e77c039912c9d5e7af33db /bin/ipcrm
    7992a936b28359d7f087a448d2b8a2418ef4f112 /bin/ipcrm
    cded383eb3b74467409c1731c2804350fe3d1123bdac7304c1c6f3af9e7976f7 /bin/ipcrm
    499f17765c0aa55ac99739c9bcac1d0c /bin/ipcs
    c476949e77ef8710398fd8ec4f78c8cf1d76a420 /bin/ipcs
    33c77a5b625f4de919f55dc24207645d219a2fde2e0b92be27c5cda8c662cd72 /bin/ipcs
    6a738c5c2506f7e87c9458e0c3df378f /bin/iptables-xml
    ba97af2e429aca6beb5a2b8861e370bbf874dee9 /bin/iptables-xml
    cb8c10461da5247e8d6d63a123ba563df95ae1e78f29e1717eb8bb02c2ca045b /bin/iptables-xml

Find files by MIME type (ignores file extension):

    $ bh_findmime -elf /bin | head
    /bin/[
    /bin/addpart
    /bin/appres
    /bin/apt
    /bin/apt-cache
    /bin/apt-cdrom
    /bin/apt-config
    /bin/apt-extracttemplates
    /bin/apt-ftparchive
    /bin/apt-get

You could pipe the results to xargs in order to calculate checksums quickly:

    $ bh_findmime -pe ~/Downloads/ | xargs shasum
    d9e49c4209087170e36cbef689d96240d736cf3b  /Users/menteb/Downloads/CSCWCNG.dll
    50dfeea02e89f41caf52df152c7cb923c667bffc  /Users/menteb/Downloads/Receitanet-1.10.exe
    86a5f89d43ab11456fb817aeceb14b83cc6c2608  /Users/menteb/Downloads/Xojo2017r3Setup.exe.opdownload

Convert string to hex in different output formats

    $ bh_str2hex mentebinaria
    6d 65 6e 74 65 62 69 6e 61 72 69 61

    $ bh_str2hex -x mentebinaria
    \x6d\x65\x6e\x74\x65\x62\x69\x6e\x61\x72\x69\x61

    $ bh_str2hex -c mentebinaria
    { 0x6d, 0x65, 0x6e, 0x74, 0x65, 0x62, 0x69, 0x6e, 0x61, 0x72, 0x69, 0x61 }

There is very basic error handling in bashacks. If a function does not receive the arguments it needs, it justs returns `1`.

There's much more. Install it and see for yourself. :)

## Changelog

### bashacks 1.5 - 2023 maybe?

* New name: bashacks
* Bugs fixed.
* New cache engine at $HOME/.bashacks/cache used by internet dependent functions like `bh_asminfo` and `bh_hashcrack`.
* New functions:
    * `bh_asminfo` - details an Assembly x86 instruction.
    * `bh_epoch` - converts an Epoch date to its human-readable equivalent.
    * `bh_findmime` - finds files by their MIME-type.
    * `bh_hostcalc` - returns the total hosts number for an IPv4 subnet.
    * `bh_md5rename` - renames files to their MD5 hash.
    * `bh_sharefile` - upload a file to file.io and returns a download link that only works once.
    * `bh_skel_c` - outputs a blank C source file skeleton.
    * `bh_skel_python` - outputs a blank Python script skeleton.
    * `bh_skel_yara` - outputs a simple Yara rule skeleton.
    * `bh_str2hexr` - converts a string to its reversed hexadecimal equivalent.
    * `bh_unshort` - gives the real URL behind shortened links.
    * `bh_urlencode` - decodes an URL-encoded string.
    * `bh_wgetr` -  site mirroring with random interval between resquests and custom User-Agent.
    * `bh_zerostring` - fill a string with nullbytes in a binary file.
    * `bh_zipmal` - zip files with 'infected' password.
    * `bh_ipblocked` - checks if an IP address is blocked by a few security vendors.
    * `bh_skel_latex` - outputs a LaTeX template.
* Removed functions:
    * `bh_intel` is not needed anymore.
    * `bh_asc2hex` result is easily achieved with `echo a | hd`.

### hack-functions 1.4 - February, 27 2012

* new function: `bh_charcalc` - performs math with characters.
* new function: `bh_intel` - set Intel syntax for disassembling.
* new function: `bh_rotall` - simultaneous ROT for strings (thanks to @laerciomasalla for suggesting it).
* created reference guide in Portuguese.
* `bh_hexcalc` now supports the four basic math operations and the result is prefixed with `0x`.
* `bh_str2hex` and `hex2str` now support the prefixes `0x`, `\x`, with or without spaces, and C-style arrays.

### hack-functions 1.2 - February, 24 2012

* new functions: `bh_bin2dec` and `bh_asc2hex`.
* added Intel syntax by default for gdb and objdump.
* curl gets replaced by wget in `bh_unmd5`.
* code optimization in many functions.

### hack-functions 1.0 - February, 24 2012

* first public release containing 20 functions.

## Known Bugs

### String escape

In some string functions you have to escape special characters because bash will try to
interpret them. See the following example using bh_strxor function:

    $ bh_strxor 0x41 fernando
    '$3/ /%.

    $ bh_strxor 0x41 "'\$3/ /%." # string between double quotes and dollar sign escaped
    fernando
    
### ZSH support

As bashacks uses the word splitting feature from bash, they don't work by default in ZSH. However, you can configure ZSH to perform word splitting with the following command:

    $ setopt sh_word_split
