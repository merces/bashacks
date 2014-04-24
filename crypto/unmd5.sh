unmd5()
{
   local USAGE="Attempts to discover the string that generated the MD5 hash using the internet (requires you to be connected).\n
   unmd5 <hash>\n
   Category  : Crypto.\n
   Parameters:
        -h   : Help.
        md5 hash to be broken.\n
    Output:
    \$ unmd5 827ccb0eea8a706c4c34a16891f84e7b 202cb962ac59075b964b07152d234b70
    827ccb0eea8a706c4c34a16891f84e7b: 12345
    202cb962ac59075b964b07152d234b70: 123"

    [ $# -eq 0 -o "$1" == '-h' ] && { 
        echo -e "${USAGE}" 
        return 1
    }

    local r=""
    local s1="http://www.md5crack.com"
    #local s2="http://www.tobtu.com/md5.php?h=$1" maintenance

	# md5crack.com new website 2014-01-24 
    r="$( wget -q --timeout=30 "${s1}" --post-data "list=$(echo $@ | sed 's/ /%0D%0A/g')&crack=Crack+Hashes" -O - |
        grep -E "([a-f0-9]){32}.+>" | html2text )"

    # MAINTENANCE
    #[ -z "${r}" ] && r="$( wget -q --timeout=30 --post-data="term=$1" "${s2}" -O - |
    #    grep 'Found:'  |
    #    sed 's/.*md5("\(.*\)").*<\/div>/\1/' )"

    echo "${r}"
}