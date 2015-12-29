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
 distributions. But you still can have advantage in use short
 commands to run tasks that commonly will require a lot of lines
 to be done.

 !!! IMPORTANT !!!

 There is no error handling in bashacks. That's a job
 for bash, called programs and your responsibility. :)


## 2. Requirements

 * bash >= 4
 * bc
 * binutils
 * file
 * grep
 * hexdump
 * html2text
 * perl
 * sed
 * ssh-keygen
 * wget
 * zip


## 3. Installation

 Use *make* command to generate a single file containing all functions and add it to your ```/etc/bash.bashrc``` file:

    $ make
    $ sudo make install

 You should now double check it all dependencies are satisfied:

    $ bh_depinstall

 And that's all. You can now call the available functions from command line by typing *bh_* and pressing *<Tab>* key.

 
## 4. Documentation

 Try:

    $ man bashacks

## 5. ChangeLog

 * bashacks 1.5 - ?
  * new name: bashacks
  + new aliases: bh_unsha1 bh_unsha256 bh_unsha356 bh_unsha512 and updated bh_unmd5
  + new function: bh_urlencode - URL decode.
  + new function: bh_urldecode - URL encode.
  + new function: bh_wgetr() -  site mirroring with random interval between resquests and custom UA.
  + new function: bh_get() - simple GET with custom UA.
  + new function: bh_isspace() - check if a character is space.
  + new function: bh_iscntrl() - check if a character is a control character.
  + new function: bh_md5rename() - rename files to their MD5 hash.
  + new function: bh_isascii() - check if a character is between ASCII set.
  + new function: bh_ispunct() - check if a character is punctuation.
  + new function: bh_findmime() - find files by their MIME-type.
  + new function: bh_zipmal() - ZIP files with 'virus' password.
  + new function: bh_isgraph() - check if a character belongs to the graphical set.
  + new function: bh_isalpha() - check if a string contains only letters.
  + new function: bh_isalnum() - check if a string contains is alphanumeric.
  + new function: bh_isupper() - check if a string contains is all uppercase.
  + new function: bh_islower() - check if a string contains is all lowercase.
  + new function: bh_isxdigit() - check if a string contains is all hexadecimal digits.
  + new function: bh_isdigit() - check if a string contains is all digits.
  + new function: bashacks_depinstall() - Install all bashacks dependencies.
  + new function: bh_ip2geo() - approximately determines geographical location of an IPv4 address.
  + new function: bh_hostcalc() - returns the total hosts number for an IPv4 subnet.
  + new function: bh_skel_python() - outputs a blank Python script skeleton.
  + new function: bh_skel_c() - outputs a blank C source file skeleton.
  + new function: bh_asminfo() - details an Assembly x86 instruction.
  + new function: bh_str2hexr() - converts a string to its reversed hexadecimal equivalent.
  + manpages added.
  + caching in $HOME/.bashacks/cache to speed up things!

 * hack-functions 1.4 - Feb, 27 2012
  + new function: bh_charcalc() - do character calculation.
  + new function: bh_intel() - set Intel syntax for disassembling.
  + new function: bh_rotall() - simultaneous ROT for strings
    (thanks to @laerciomasalla for suggesting it).
  + created reference guide in Portuguese.
  * bh_hexcalc() now supports the four basic math operations and the result is
    prefixed with '0x'.
  * bh_str2hex() and hex2str() now support the prefixes '0x', '\x', with or
    without spaces and C-array notation.

 * hack-functions 1.2 - Feb, 24 2012
  + new functions: bh_bin2dec() and bh_asc2hex().
  + added Intel syntax by default for gdb and objdump.
  * curl gets replaced by wget in bh_unmd5().
  * code optimization in many functions.

 * hack-functions 1.0 - Feb, 24 2012
  - first public release with 20 functions.


## 6. Bugs

 If you think you find a bug, please fill it through
 https://github.com/merces/bashacks/issues
