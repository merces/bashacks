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

 * linux
 * bash >= 4
 * bc
 * wget - and internet access
 * hexdump
 * grep
 * objdump
 * base64
 * md5sum
 * cut
 * gdb
 * rev
 * html2text
 * tee
 * udcli e udis86 - for sc2asm() only
 * nasm - for asm2sc() only
 * awk
 * iw


## 3. Installation

 After generate bashacks.sh using Makefile provided,
 put in some directory and 'source' it to your
 shell using .bashrc for example:

    $ sudo make
    $ sudo mv bashacks.sh /opt
    $ echo "source /opt/bashacks.sh" >> $HOME/.bashrc
    $ source /opt/bashacks.sh

 And that's all. You can now call the available functions from command line.

 Additionally you need to install libudis86 to use sc2asm function. Go
 to http://udis86.sourceforge.net, download the latest version and run:

    $ tar xf udis86-*.tar.gz
    $ cd udis86-*
    $ ./configure
    $ make
    # make install
    $ cd udcli
    $ make
    # make install

 or

    $ su
    # source /opt/bashacks.sh
    # bashacks_depinstall 

## 4. Documentation

 See bh-referencia.html. It will be improved in the future.

 or

    $ man bashacks

 Available in 'pt_BR' and 'en'. 

## 5. ChangeLog

 * bashacks 1.5 - ?
  * new name: bashacks
  + new alias: bh_unsha1 bh_unsha256 bh_unsha356 bh_unsha512 and update bh_unmd5
  + new function: bh_isperlm - validates perl module is installed return yes or no
  + new function: bh_bin2sc - Generates 'shellcode' of a binary file
  + new function: bh_urlencode - Decodes string web standar on human format
  + new function: bh_urldecode - Encodes string in web standard
  + new function: bh_wgetr() -  Downloads pages of a url on continuous mode and intervall randomly setted.
  + new function: bh_get() - Download page from absolute url, only one page, is nonrecursive.
  + new function: bh_isspace() - validate whether char is space.
  + new function: bh_iscntrl() - validate char is controler char.
  + new function: bh_md5rename() - rename file with md5 message digest.
  + new file: man/en/bashacks.1  - page english language.
  + new file: man/pt_BR/bashacks.1 - page Portuguese language.
  + new function: bh_isascii() - determines whether char is ascii.
  + new function: bh_ispunct() - determines whether char is punctuatio.
  + new function: bh_sitedl() - download an entire website with random request timeouts and custom User-Agent.
  + new function: bh_findmime() - find files by true MIME type.
  + new function: bh_zipmal() - ZIP a malware file with 'virus' password.
  + new function: bh_isgraph() - determines whether char is graph.
  + new function: bh_isalpha() - determines whether string or char is alpha.
  + new function: bh_isalnum() - determines whether string or char is alphanumeric.
  + new function: bh_isupper() - determines whether char or string is uppercase.
  + new function: bh_islower() - determines whether char or string is lowercase.
  + new function: bh_isxdigit() - determines whether string or char is hex digit
  + new function: bh_isdigit() - determines whether string or char is digit.
  + new function: bashacks_depinstall() - install all dependencies bashacks.
  + new function: bh_ip2geo() - approximately determines geographical location of address.
  + new function: bh_hostcalc() - returns the total number of hosts.
  + new function: bh_wscan() - displays the list of wireless networks.
  + new function: bh_websearch() - uses google base to extract information.
  + new function: bh_skel_python() - creates a blank Python source file.
  + new function: bh_skel_c() - creates a blank C source file.
  + new function: bh_asminfo() - details an Assembly x86 (Intel) instruction.
  + new function: bh_dumpheap() - dump the process heap content.
  + new function: bh_dumpstack() - dump a process stack content,
  + new function: bh_str2hexr() - converts string to reversed hexa bytes.
  + new function: bh_asm2sc() - creates a payload from assembly instructions.
  + new function: bh_sc2asm() - disassembles a payload.
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
