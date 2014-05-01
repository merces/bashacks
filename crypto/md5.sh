md5()
{
    local USAGE="Calculates the MD5 hash of a string (without considering the caracetere newline) or a file if it exists\n
   md5 <string|file>\n
   Category  : Crypto.\n
   Parameters:
        -h     : Help.
        string or file the cauculates hash..\n
    Output:
    \$ md5 '123456'
    e10adc3949ba59abbe56e057f20f883e
    \$ md5 /etc/passwd
    18186ca65c92ba40cfe8ed4089496c42"

    [ $# -eq 0 -o "$1" == '-h' ] && { 
        echo -e "${USAGE}"
        return 1
    }

	test -e $1 && \
	    md5sum < "$1" | cut -d' ' -f1 \
	       || \
	        echo -n "$1" | md5sum | cut -d' ' -f1
}
