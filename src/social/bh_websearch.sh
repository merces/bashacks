bh_websearch()
{
    local i                     # count for() pagination
    local TYPE                  # type {mail,file,phone...}
    local DOMAIN                # domainame
    local TOPAGE=50             # set default pagination 
    local TMP="$(mktemp)"       # tmp file, store search
    local AGENT="Mozilla/5.0"   # user agent browser default
    local SEARCH                # variable to store rearch and submit google page
    local EXTENSION             # variable to store filetype as to search for file
    local EXTRACT               # variable with regular expression to extract data/information
    local STRING=""             # 
    local DOWNLOAD=0            # set donwload all file - default no
    OPTIND=0                    # getopts no crazy

    # run param
    while getopts ":g:t:s:d:e:p:" o
    do
        case "${o}" in
            g) DOWNLOAD=1
            ;;
            t) TYPE=${OPTARG}
            ;;
            p) 
                if $(bh_isdigit ${OPTARG}) ; then
                    TOPAGE=$(echo 10*${OPTARG} | bc )
                else 
                    TOPAGE=50
                fi
            ;;
            d) DOMAIN=${OPTARG}
            ;;
            s)  
                [ ! -z "$(echo "$*" | grep "t free")" ] &&
                    STRING="$OPTARG" ||
                        STRING="intext:${OPTARG}"
            ;;
            e) EXTENSION=${OPTARG}
            ;;
        esac
    done

    [ -z "${TYPE}" ] && return 1 
    
    case "${TYPE}" in
        mail|phone|file)
            [ -z "${DOMAIN}" ] && {
                echo "Domain is required to type ${TYPE}"
                return 1
            }
            ;;
    esac

    [ "${TYPE}" == "mail" ] && {
        SEARCH="%22@${DOMAIN}%22"
        EXTRACT="sed -e 's/<[^>]*>//g' | 
                grep -Ewo '([A-Za-z0-9_\.\-]){1,}\@${DOMAIN}' "
    } 

    [ "${TYPE}" == "file" -a ! -z "${EXTENSION}" ] && {
        SEARCH="site:${DOMAIN}%20filetype:${EXTENSION}%20${STRING}" 
        EXTRACT="tr '<' '\n' | 
                grep -Ewo 'a href=\".*' | 
                grep -Ev \"(google|search)\" | 
                sed 's/a href=\"//g;s/&amp;sa//g' | 
                grep '/url' | 
                cut -d'=' -f2"
    }

    [ "${TYPE}" == "phone" ] && {
        SEARCH="site:${DOMAIN}%20(contato|faleconosco|telefone|telephone|phone|contact)"
        EXTRACT="grep -Ewo '(\(([0xx|0-9]){2,3}\)|([0-9]){2,3}).([0-9]){3,4}.([0-9]){4,5}' "
    }
    
    # free     
    [ "${TYPE}" == "free" -a ! -z "${STRING}" ] && {
        SEARCH="$(echo "${STRING}"|sed 's/^intext://')"
        EXTRACT="tr '<' '\n' | 
                grep -Ewo 'a href=\".*' | 
                grep -Ev \"(google|search)\" | 
                sed 's/a href=\"//g;s/&amp;sa//g' | 
                grep '/url' | 
                cut -d'=' -f2"
    } 
    [ -z "${SEARCH}" ] && return 1

    echo "[ ${TYPE} ] IN ${DOMAIN} ${EXTENSION}"

    for (( i=0 ; i<=${TOPAGE} ; i+=10 ))
    do
        echo "[+] ${i}"
        wget -q -T 30 -U "${AGENT}" -O - \
            "http://www.google.com.br/search?q=${SEARCH}&btnG=&start=${i}" &> ${TMP}
    done
    
    echo "============================================="

    [ ${DOWNLOAD} -eq 1 -a ${TYPE} == 'file' ] && {
        # tmp file store list
        LISTTMP=$(mktemp)
        # directory does not exist create it
        [ ! -d "${DOMAIN}" ] &&
            mkdir "${DOMAIN}"

        #
        cat ${TMP} | eval ${EXTRACT} | sort -u > ${LISTTMP}
        echo "Iniciando Download de $( cat ${LISTTMP} | wc -l ) Arquivos"
        # if elements exist - download
        [ $( wc -l ${LISTTMP} | cut -d" " -f1 ) -gt 0 ] &&
                wget -P "${DOMAIN}" -i ${LISTTMP} &>/dev/null
        [ $? -eq 0 ] &&
            echo "Download feito em ${DOMAIN}"

        rm -f ${LISTTMP}
    } || {
        # just list on then screen
        cat ${TMP} | eval ${EXTRACT} | sort -u
    }

    rm -rf ${TMP}
}
