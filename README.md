# bashacks

 1. What is that
 2. Requirements
 3. Installation
 4. Documentation
 5. Usage examples
 6. Changelog
 7. Known bugs

## 1. What is that

 bashacks is an open source (GPL) set of bash functions
 probably useful for programmers, security analysts and general
 users that need some low level type of operations.

 In fact, there is nothing really new in bashacks since
 all functions are written using exiting software in GNU/Linux
 distributions. But you still can take advantage in use short
 commands to run tasks that commonly would require many lines
 of code to be achieved.

 There is no error handling in bashacks. That's a job
 for bash, the programs you call and yourself. :kissing_heart:

## 2. Requirements

* bash >= 4
* bc
* binutils
* coreutils
* file
* grep
* hexdump
* html2text
* perl
* sed
* wget
* zip

## 3. Installation

Use *make* command to generate a single file containing all functions and add it to your ```/etc/bash.bashrc``` file:

    make
    make install

 That's all. You can now check the available functions from command line by typing *bh_* and pressing the tab key.

## 4. Documentation

    man bashacks

## 5. Usage examples

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

Calculate common checksums for a given file

    $ bh_hashes /bin/ls
    d77c1dd5bb8e39c2dd27c96c3fd2263e /bin/ls
    e332cf8e1a78427f1368a5a0a67946ad1e7c8e28 /bin/ls
    5abf61c361e5ef91582e70634dfbf2214fbdb6f29c949160b69f27ae947d919d /bin/ls

Find files by MIME type (ignores file extension):

    $ cd /bin
    $ bh_findmime -macho
    [
    bash
    cat

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

There's much more. Install it and see by your own.

## 6. Changelog

### bashacks 1.5 - March, 2018

* new name: bashacks
* manpages added.
* many bugs fixed.
* new cache engine at $HOME/.bashacks/cache to speed up things!
* new function: bh_asminfo() - details an Assembly x86 instruction.
* new function: bh_depinstall() - installs all bashacks dependencies.
* new function: bh_epoch() - converts an Epoch date to its human-readable equivalent.
* new function: bh_fileinfo() - Retrieves advanced information from a file given.
* new function: bh_findmime() - finds files by their MIME-type.
* new function: bh_get() - simple GET with custom User-Agent.
* new function: bh_hostcalc() - returns the total hosts number for an IPv4 subnet.
* new function: bh_ip2geo() - approximately determines geographical location of an IPv4 address.
* new function: bh_md5rename() - renames files to their MD5 hash.
* new function: bh_skel_c() - outputs a blank C source file skeleton.
* new function: bh_skel_python() - outputs a blank Python script skeleton.
* new function: bh_str2hexr() - converts a string to its reversed hexadecimal equivalent.
* new function: bh_urlencode - Decodes an URL-encoded string.
* new function: bh_wgetr() -  site mirroring with random interval between resquests and custom User-Agent.
* new function: bh_zipmal() - ZIP files with 'virus' password.

### hack-functions 1.4 - February, 27 2012

* new function: bh_charcalc() - perform character math.
* new function: bh_intel() - set Intel syntax for disassembling.
* new function: bh_rotall() - simultaneous ROT for strings (thanks to @laerciomasalla for suggesting it).
* created reference guide in Portuguese.
* bh_hexcalc() now supports the four basic math operations and the result is prefixed with '0x'.
* bh_str2hex() and hex2str() now support the prefixes '0x', '\x', with or without spaces and C-array notation.

### hack-functions 1.2 - February, 24 2012

* new functions: bh_bin2dec() and bh_asc2hex().
* added Intel syntax by default for gdb and objdump.
* curl gets replaced by wget in bh_unmd5().
* code optimization in many functions.

### hack-functions 1.0 - February, 24 2012

* first public release containing 20 functions.

## 7. Knwon bugs

In some string functions you have to escape special characters because bash will try to
interpret them. See the following example using bh_strxor function:

    $ bh_strxor 0x41 fernando
    '$3/ /%.

    $ bh_strxor 0x41 "'\$3/ /%." # string between double quotes and dollar sign escaped
    fernando

If you think you find a bug, please fill it at <https://github.com/merces/bashacks/issues>
