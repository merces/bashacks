bh_findmime()
{
	local dir=.
	local filetype
	local opt
	local matches

	[ -d "$2" ] && dir="$2"

	case $1 in
		'-txt')
			opt='text/';;
		'-zip')
			opt='application/zip';;
		'-exe')
			opt='application/x-dosexec';;
		'-msi')
			opt='application/vnd.ms-office';;
		*)
			return
	esac

	# buffering results
	matches=$(for i in "$dir"/*; do
		filetype=$(file -Nb --mime-type "$i")
		[[ "$filetype" =~ "$opt" ]] && echo "${i#./*}"
	done)

	[ -n "$matches" ] && echo "$matches"
}
