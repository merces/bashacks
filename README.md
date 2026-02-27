# bashacks

## What?

bashacks is a collection of bash functions likely to be useful for programmers, security analysts, and general users who need low-level operations.

In fact, there is nothing really new in bashacks; all functions are written using existing software in UNIX-like systems. However, it lets you use shorter commands to perform tasks that would normally require multiple commands.

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

## Building

Use the *make* command to generate a single file containing all functions and `source` it:

```shell
make
source bashacks.sh
```

That's all. You can now check the available functions from a new terminal typing *bh_* and pressing `Tab`.

If you want to make it persistent, add it to your `~/.bash_profile`:

```shell
echo "source $(pwd)/bashacks.sh" >> ~/.bash_profile
```

## Documentation

There's [some](https://bashacks.readthedocs.io/), but it is outdated. PRs are welcome!

## Usage

What is the current time in Epoch?

```shell
$ bh_epoch
1522324129
```

Alphabetically add 4 to 'f'

```shell
$ bh_charcalc f + 4
j
```

Check my external IP address

```shell
$ bh_myip
177.212.113.13
```

Create a basic C program skeleton

```shell
$ bh_skel_c > hello.c
$ cat hello.c
```

This would output:

```c
#include <stdio.h>

int main(int argc, char *argv[]) {


    return 0;
}
```

Calculate common checksums for files

```shell
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
```

Find files by MIME type (ignores file extension):

```shell
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
```

You could pipe the results to xargs in order to calculate checksums quickly:

```shell
$ bh_findmime -pe ~/Downloads/ | xargs shasum
d9e49c4209087170e36cbef689d96240d736cf3b  /Users/menteb/Downloads/CSCWCNG.dll
50dfeea02e89f41caf52df152c7cb923c667bffc  /Users/menteb/Downloads/Receitanet-1.10.exe
86a5f89d43ab11456fb817aeceb14b83cc6c2608  /Users/menteb/Downloads/Xojo2017r3Setup.exe.opdownload
```

Convert a string to hex in various output formats

```shell
$ bh_str2hex mentebinaria
6d 65 6e 74 65 62 69 6e 61 72 69 61
```

```shell
$ bh_str2hex -x mentebinaria
\x6d\x65\x6e\x74\x65\x62\x69\x6e\x61\x72\x69\x61
```

```shell
$ bh_str2hex -c mentebinaria
{ 0x6d, 0x65, 0x6e, 0x74, 0x65, 0x62, 0x69, 0x6e, 0x61, 0x72, 0x69, 0x61 }
```

There is very basic error handling in bashacks. If a function does not receive the arguments it needs, it just returns `1`.

There's much more. Install it and see for yourself. :)

## Known issues

### String escape

In some string functions you have to escape special characters because bash will try to
interpret them. See the following example using `bh_strxor` function:

```shell
$ bh_strxor 0x41 fernando
'$3/ /%.

$ bh_strxor 0x41 "'\$3/ /%." # string between double quotes and dollar sign escaped
fernando
```
    
### Zsh support

Many bashacks functions use the word splitting feature from bash, so they don't work by default in Zsh. However, you can configure Zsh to perform word splitting with the following command:

```shell
$ setopt sh_word_split
```

Then things should work.
