bh_unbase64()
{
   local USAGE="Decodes a BASE64 string.\n
   bh_unbase64 <string base64>\n
   Category  : Crypto.\n
   Parameters:
        -h     : Help.
        string : Base64 encoded string.\n
   Output:
   \$ bh_unbase64 b3p6eSBvc2JvdXJuZQ==
   ozzy osbourne"

    [ $# -eq 0 -o "$1" == '-h' ] && { 
        echo -e "${USAGE}"
        return 1
    }
    
    echo $1 | base64 -d
    echo
}
