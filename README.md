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

    $ make
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


## 5. ChangeLog

 * bashacks 1.5 - ?
  * new name: bashacks
  + new function: isgraph() - determines whether char is graph.
  + new function: isalpha() - determines whether string or char is alpha.
  + new function: isalnum() - determines whether string or char is alphanumeric.
  + new function: isupper() - determines whether char or string is uppercase.
  + new function: islower() - determines whether char or string is lowercase.
  + new function: isxdigit() - determines whether string or char is hex digit
  + new function: isdigit() - determines whether string or char is digit.
  + new function: bashacks_depinstall() - install all dependencies bashacks.
  + new function: ip2geo() - approximately determines geographical location of address.
  + new function: hostcalc() - returns the total number of hosts.
  + new function: wscan() - displays the list of wireless networks.
  + new function: websearch() - uses google base to extract information.
  + new function: skel_python() - creates a blank Python source file.
  + new function: skel_c() - creates a blank C source file.
  + new function: asminfo() - details an Assembly x86 (Intel) instruction.
  + new function: dumpheap() - dump the process heap content.
  + new function: dumpstack() - dump a process stack content,
  + new function: str2hexr() - converts string to reversed hexa bytes.
  + new function: asm2sc() - creates a payload from assembly instructions.
  + new function: sc2asm() - disassembles a payload.
  + caching in $HOME/.bashacks/cache to speed up things!

 * hack-functions 1.4 - Feb, 27 2012
  + new function: charcalc() - do character calculation.
  + new function: intel() - set Intel syntax for disassembling.
  + new function: rotall() - simultaneous ROT for strings
    (thanks to @laerciomasalla for suggesting it).
  + created reference guide in Portuguese.
  * hexcalc() now supports the four basic math operations and the result is
    prefixed with '0x'.
  * str2hex() and hex2str() now support the prefixes '0x', '\x', with or
    without spaces and C-array notation.

 * hack-functions 1.2 - Feb, 24 2012
  + new functions: bin2dec() and asc2hex().
  + added Intel syntax by default for gdb and objdump.
  * curl gets replaced by wget in unmd5().
  * code optimization in many functions.

 * hack-functions 1.0 - Feb, 24 2012
  - first public release with 20 functions.


## 6. Bugs

 If you think you find a bug, please fill it through
 https://github.com/merces/bashacks/issues
