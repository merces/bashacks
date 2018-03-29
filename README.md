# bashacks

 1. What is it?
 2. Requirements
 3. Installation
 4. Documentation
 5. ChangeLog
 6. Bugs

## 1. What is it?

 bashacks is an open source (GPL) set of bash functions
 probably useful for programmers, security analysts and general
 users that need to do some low level type of operation.

 In fact, there is nothing really new in bashacks since
 all functions are written using exiting software in GNU/Linux
 distributions. But you still can take advantage in use short
 commands to run tasks that commonly would require many lines
 of code to be achieved.

 !!! IMPORTANT !!!

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

    $ make
    $ sudo make install

 That's all. You can now check the available functions from command line by typing *bh_* and pressing the tab key.

## 4. Documentation

    $ man bashacks

## 5. ChangeLog

### bashacks 1.5 - ?
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

### hack-functions 1.4 - Feb, 27 2012
* new function: bh_charcalc() - perform character math.
* new function: bh_intel() - set Intel syntax for disassembling.
* new function: bh_rotall() - simultaneous ROT for strings (thanks to @laerciomasalla for suggesting it).
* created reference guide in Portuguese.
* bh_hexcalc() now supports the four basic math operations and the result is prefixed with '0x'.
* bh_str2hex() and hex2str() now support the prefixes '0x', '\x', with or without spaces and C-array notation.

 ### hack-functions 1.2 - Feb, 24 2012
* new functions: bh_bin2dec() and bh_asc2hex().
* added Intel syntax by default for gdb and objdump.
* curl gets replaced by wget in bh_unmd5().
* code optimization in many functions.

### hack-functions 1.0 - Feb, 24 2012
* first public release containing 20 functions.

## 6. Bugs

 If you think you find a bug, please fill it at
 https://github.com/merces/bashacks/issues
