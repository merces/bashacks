bh_findmime() {
	(( $# < 2 )) && return 1

	local dir=.
	local filetype
	local opt
	local matches

	[[ -d "$2" ]] && dir="$2"

	case $1 in
		# documents
		-txt)
			opt='text/';;
		-pdf)
			opt='pdf' ;;
		-office)
			opt='vnd\.openxmlformats\-officedocument' ;;

		# compressed
		-zip)
			opt='zip';;
		-rar)
			opt='x\-rar' ;;

		# executables
		-pe)
			opt='(x\-dosexec|vnd\.microsoft\.portable\-executable)' ;;
		-msi)
			opt='vnd\.ms\-office' ;;
		-macho)
			opt='x\-mach\-binary' ;;
		-elf)
			opt='x\-(executable|pie\-executable|sharedlib)' ;;
		*)
			return
	esac

	# buffering results
	matches=$(for i in "$dir"/*; do
		filetype=$(file -Nb --mime-type "$i")
		[[ "$filetype" =~ application/$opt ]] && echo "${i#./*}"
	done)

	[[ -n "$matches" ]] && echo "$matches" | tr -s / /
}
