bh_md5()
{
    [ $# -eq 0 ] && return 1

	test -e $1 && \
	    md5sum < "$1" | cut -d' ' -f1 \
	       || \
	        echo -n "$1" | md5sum | cut -d' ' -f1
}
