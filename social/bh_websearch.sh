bh_websearch()
{
    local USAGE="Uses google base to extract information such as sql files, txt or anything else that can serve 
to extract information, other functionality are finding email phones.\n
   bh_websearch -t <mail|file|phone|free> -p <num pages optional> -d <domain> -e <file Extension> -s <string> -g <1>\n
   Category  : Social Engineering.\n
   Parameters:
        -t   :   mail,file,phone,free one type is required
        -p   :   Number of pages OPTIONAL
        -d   :   Domain Name or IpAddress is required
        -e   :   Extension for query
        -s   :   Parameter needed to free type and optional for others
        -g   :   Performs the download of all files of the query (set 1) 
        -h   :   Help.

   Output:
   \$ bh_websearch -t file -e txt -d mentebinaria.com.br -p 2
   [ file ] IN mentebinaria.com.br txt
   [+] 0
   [+] 10
   [+] 20
   =============================================
   mentebinaria.com.br/artigos/0x0a/gamevista.txt
   mentebinaria.com.br/artigos/0x0b/virtlinux.txt
   mentebinaria.com.br/artigos/0x0d/altexe.txt\n"

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
    while getopts ":g:t:s:d:e:p:h:" o
    do
        case "${o}" in
            g) DOWNLOAD=1
            ;;
            t) TYPE=${OPTARG}
            ;;
            p) isdigit ${OPTARG}
               test $? -eq 0 && TOPAGE=$(echo 10*${OPTARG} | bc ) || TOPAGE=50
            ;;
            d) DOMAIN=${OPTARG}
            ;;
            s) [ -z "$1" ] && STRING="" || STRING="intext:${OPTARG}"
            ;;
            e) EXTENSION=${OPTARG}
            ;;
            h) echo -e "${USAGE}" 
            ;;
        esac
    done

    [ ! -z "${TYPE}" -a ! -z "${DOMAIN}" ] && {

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

        #### 

        echo "[ ${TYPE} ] IN ${DOMAIN} ${EXTENSION}"

	    for (( i=0 ; i<=${TOPAGE} ; i+=10 ))
	    do
		    echo "[+] ${i}"
		    wget -q -T 30 -U "${AGENT}" -O - \
                "http://www.google.com.br/search?q=${SEARCH}&btnG=&start=${i}" &>> ${TMP}
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
                    wget -P "${DOMAIN}" -i ${LISTTMP} &>>/dev/null
            [ $? -eq 0 ] &&
                echo "Download feito em ${DOMAIN}"

            rm -f ${LISTTMP}
        } || {
            # just list on then screen
            cat ${TMP} | eval ${EXTRACT} | sort -u
        }

        rm -rf ${TMP}
    } || echo -e "${USAGE}"

}
