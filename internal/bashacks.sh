bashacks()
{
    local USAGE="Lists all functions with small summary\n
    hf_functions_list\n
    Category  : Internal Functions\n
    Parameters:
        -h  : Help.
        No Parameters\n
    Output:
    small summary here"

    [ "$1" == "-h" ] && { echo -e "${USAGE}" ; return 1; }
    local func
    local resume
    local category
    local count

    for func in $( cat ${BASH_SOURCE} |
        grep '()$' |
        grep -Ev '^#|\ ')
    do
        resume="$( cat ${BASH_SOURCE} |
                sed "/^${func}/,/^}/ s/^/-/" |
                grep '^-' |
                grep -E 'USAGE|Category' |
                cut -d \" -f2 |
                sed 's/\\n//g;s/-/:/' |
                tr \\n ' ' )"

        category="$(echo ${resume} |
                awk -F\: '{print $3}' |
                sed -r 's/\$\{USAGE\}|\$1//g')"

        printf '%12s\t%20s\t%3s\n' "${func}" "${category}" "$( echo ${resume} | awk -F\: '{print $1}')..."
        charcal - \* $(tput cols)
        count=$((count+1))
    done
    echo "${count} Functions "
}
