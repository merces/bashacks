strxor()
{
    local USAGE="Calculates exclusive OR of each character in a string with a key.\n
   strxor <key> <string>\n
   Category  : Crypto.\n
   Parameters:
        -h     : Help.
        key    : The value in decimal or hexadecimal (prefixed with '0x') to perform
                 the XOR with the characters of the string.
        string : The string to go through the 'xor'.\n
    Output:
    \$ strxor 4 'ieikjew\$ewwewwmjew'
    mamonas assassinas
    \$ strxor 0xa 'pink floyd'
    zcda*lfesn"

    [ $# -lt 2 -o "$1" == '-h' ] && {
        echo -e "${USAGE}"
        return 1
    }

    local str
    local xored
    local i

    # $2 is the string and $1 is the xor key
    str=$(str2hex "$2")

    for i in $str; do
       		xored="$xored $(dec2hex $((0x$i^$1)))"
   	done

   	hex2str "$xored"
}