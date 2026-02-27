# Changelog

## bashacks 1.5 - ?

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
    * `bh_asc2dec` you can get the same results with `bh_str2dec`.
    * `bh_asc2hex` result is easily achieved with `echo a | hd`.
    * `bh_hashcrack` the service previously used went down again, and this is hard to maintain.

## hack-functions 1.4 - February, 27 2012

* new function: `bh_charcalc` - performs math with characters.
* new function: `bh_intel` - set Intel syntax for disassembling.
* new function: `bh_rotall` - simultaneous ROT for strings (thanks to @laerciomasalla for suggesting it).
* created reference guide in Portuguese.
* `bh_hexcalc` now supports the four basic math operations and the result is prefixed with `0x`.
* `bh_str2hex` and `hex2str` now support the prefixes `0x`, `\x`, with or without spaces, and C-style arrays.

## hack-functions 1.2 - February, 24 2012

* new functions: `bh_bin2dec` and `bh_asc2hex`.
* added Intel syntax by default for gdb and objdump.
* curl gets replaced by wget in `bh_unmd5`.
* code optimization in many functions.

## hack-functions 1.0 - February, 24 2012

* first public release containing 20 functions.