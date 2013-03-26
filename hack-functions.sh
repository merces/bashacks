#!/bin/bash
#
# hack-functions 1.4 - bash functions to do little hacks
#
# Copyright (C) 2012 Fernando Mercês
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

hf_user_path=$HOME/.hf
hf_cache=$hf_user_path/cache/asm

checkdir() { test -d $hf_cache || mkdir -p $hf_cache; }

isnumber() { [ ! -z  $1 ] && [ -z "$( echo $1 | grep -Ewv '([0-9]){1,}' )" ] && echo "TRUE" || echo "FALSE" ; } 

########################### Conversão de base ###########################

# dec2hex - converte decimal para hexadecimal
dec2hex() { printf "%x\n" "$1"; }

# hex2dec - converte hexadecimal para decimal
hex2dec() { echo $((0x${1#0x})); }

# dec2bin - converte decimal para binário
dec2bin() { echo "obase=2;$1" | bc; }

# bin2dec - converte binário para decimal
bin2dec() { echo $((2#$1)); }

hex2bin()
{
	local bin

	for i in $*; do
		bin=$(echo "obase=2;ibase=16;$(echo $i | tr a-f A-F)" | bc)
		echo -n "$bin "
	done
	echo
}

################# Conversão de caracteres e strings #####################

# dec2asc - converte um número decimal para seu caractere equivalente em ASCII
dec2asc() { echo -e $(printf "\\\x%x" $1); }

# asc2dec - converte um caractere ASCII em decimal
asc2dec() { printf "%d\n" "'$1"; }

# str2hex - converte uma string para bytes em hexadecimal
str2hex()
{
	case "$1" in
		"-s") 
			echo -n "$2" | hexdump -ve '/1 "%02x"' | sed 's/^/0x/' 
			echo
			;;
		"-x")
			echo -n "$2" | hexdump -ve '/1 "%02x"' | sed 's/../\\x&/g'
			echo
			;;
		"-0x")
			echo -n "$2" | hexdump -ve '/1 "0x%02x "' | sed 's/\(.*\) /\1/'
			echo
			;;
		"-c")
			echo -n '{'
			echo -n "$2" | hexdump -ve '/1 "0x%02x, "' | sed 's/\(.*\), /\1/'
			echo '}'
			;;
		*)
			echo -n "$1" | hexdump -ve '/1 "%02x "' | sed 's/\(.*\) /\1/'
			echo
			;;
	esac
}

# str2hexr - str2hex com bytes em ordem reversa na saída
str2hexr()
{
	case "$1" in
		"-x" | "-0x" | "-c" | "-s")
			str2hex $1 "$(echo "$2" | rev)"
			;;
		*)
			str2hex "$(echo "$1" | rev)"
			;;
	esac
}

# hex2str - converte bytes em hexadecimal para string
hex2str()
{
	local hex
	local str

	# remove todos os '0x', '\x', espaços, vírgulas e chaves
	hex=$(echo $1 | sed 's/\(0x\|\\x\| \|{\|}\|,\)//g')

	# insere um espaço a cada dois caracteres
	hex=$(echo $hex | sed 's/../& /g')

	# prefixa os bytes hexa com '\x' (necessário para o echo)
	for i in $hex; do
		str="$str\\x$i"
	done

	echo -e $str
}

# charcalc - efetua cálculos com caracteres
charcalc()
{
	local char
	local res

	case $2 in
		+|-)
			char=$(asc2dec $1)
			res=$(($char $2 $3))
			dec2asc $res
		;;
		'*')
			for (( i=0; i<$3; i++ )); do
				res="$res$1"
			done
			echo $res
		;;
	esac
}

# asciitable - imprime a tabela ASCII
asciitable()
{
	echo -en \
	"Dec Hex    Dec Hex    Dec Hex  Dec Hex  Dec Hex  Dec Hex   Dec Hex   Dec Hex\n\
  0 00 NUL  16 10 DLE  32 20    48 30 0  64 40 @  80 50 P   96 60 \`  112 70 p\n\
  1 01 SOH  17 11 DC1  33 21 !  49 31 1  65 41 A  81 51 Q   97 61 a  113 71 q\n\
  2 02 STX  18 12 DC2  34 22 \"  50 32 2  66 42 B  82 52 R   98 62 b  114 72 r\n\
  3 03 ETX  19 13 DC3  35 23 #  51 33 3  67 43 C  83 53 S   99 63 c  115 73 s\n\
  4 04 EOT  20 14 DC4  36 24 $  52 34 4  68 44 D  84 54 T  100 64 d  116 74 t\n\
  5 05 ENQ  21 15 NAK  37 25 %  53 35 5  69 45 E  85 55 U  101 65 e  117 75 u\n\
  6 06 ACK  22 16 SYN  38 26 &  54 36 6  70 46 F  86 56 V  102 66 f  118 76 v\n\
  7 07 BEL  23 17 ETB  39 27 '  55 37 7  71 47 G  87 57 W  103 67 g  119 77 w\n\
  8 08 BS   24 18 CAN  40 28 (  56 38 8  72 48 H  88 58 X  104 68 h  120 78 x\n\
  9 09 HT   25 19 EM   41 29 )  57 39 9  73 49 I  89 59 Y  105 69 i  121 79 y\n\
 10 0A LF   26 1A SUB  42 2A *  58 3A :  74 4A J  90 5A Z  106 6A j  122 7A z\n\
 11 0B VT   27 1B ESC  43 2B +  59 3B ;  75 4B K  91 5B [  107 6B k  123 7B {\n\
 12 0C FF   28 1C FS   44 2C ,  60 3C <  76 4C L  92 5C \\  108 6C l  124 7C |\n\
 13 0D CR   29 1D GS   45 2D -  61 3D =  77 4D M  93 5D ]  109 6D m  125 7D }\n\
 14 0E SO   30 1E RS   46 2E .  62 3E >  78 4E N  94 5E ^  110 6E n  126 7E ~\n\
 15 0F SI   31 1F US   47 2F /  63 3F ?  79 4F O  95 5F _  111 6F o  127 7F DEL\n"
}

# imprime a tabelta unicode utf-8 latin
utf8table()
{
	echo -en \
"Hex      Hex      Hex      Hex      Hex      Hex      Hex      Hex\n\
c2 a0    c2 ac ¬  c2 b8 ¸  c3 84 Ä  c3 90 Ð  c3 9c Ü  c3 a8 è  c3 b4 ô\n\
c2 a1 ¡  c2 ad ­  c2 b9 ¹  c3 85 Å  c3 91 Ñ  c3 9d Ý  c3 a9 é  c3 b5 õ\n\
c2 a2 ¢  c2 ae ®  c2 ba º  c3 86 Æ  c3 92 Ò  c3 9e Þ  c3 aa ê  c3 b6 ö\n\
c2 a3 £  c2 af ¯  c2 bb »  c3 87 Ç  c3 93 Ó  c3 9f ß  c3 ab ë  c3 b7 ÷\n\
c2 a4 ¤  c2 b0 °  c2 bc ¼  c3 88 È  c3 94 Ô  c3 a0 à  c3 ac ì  c3 b8 ø\n\
c2 a5 ¥  c2 b1 ±  c2 bd ½  c3 89 É  c3 95 Õ  c3 a1 á  c3 ad í  c3 b9 ù\n\
c2 a6 ¦  c2 b2 ²  c2 be ¾  c3 8a Ê  c3 96 Ö  c3 a2 â  c3 ae î  c3 ba ú\n\
c2 a7 §  c2 b3 ³  c2 bf ¿  c3 8b Ë  c3 97 ×  c3 a3 ã  c3 af ï  c3 bb û\n\
c2 a8 ¨  c2 b4 ´  c3 80 À  c3 8c Ì  c3 98 Ø  c3 a4 ä  c3 b0 ð  c3 bc ü\n\
c2 a9 ©  c2 b5 µ  c3 81 Á  c3 8d Í  c3 99 Ù  c3 a5 å  c3 b1 ñ  c3 bd ý\n\
c2 aa ª  c2 b6 ¶  c3 82 Â  c3 8e Î  c3 9a Ú  c3 a6 æ  c3 b2 ò  c3 be þ\n\
c2 ab «  c2 b7 ·  c3 83 Ã  c3 8f Ï  c3 9b Û  c3 a7 ç  c3 b3 ó  c3 bf ÿ\n"
}

############################# Criptografia ###########################

# unbase64 - decodifica base64 numa string
unbase64() { echo $1 | base64 -d; }

# md5 - calcula o hash MD5 de uma string ou arquivo
md5()
{
	test -e $1 && \
		md5sum < "$1" | cut -d' ' -f1 \
	|| \
		echo -n "$1" | md5sum | cut -d' ' -f1
}

# unmd5 - tenta descobrir a string que gerou o hash md5
unmd5()
{
	local r=""
        local s1="http://md5crack.com/crackmd5.php"
        local s2="http://www.tobtu.com/md5.php?h=$1"

	# adicionado site tobtu.com, md5crack consta fora do ar - 11-12-12
        r="$( wget -q --timeout=30 "${s2}" -O - |
         grep -E "([a-f0-9]){32}" |
         cut -d':' -f3  )"

        [ -z "${r}" ] && r="$( wget -q --timeout=30 --post-data="term=$1" "${s1}" -O - |
         grep 'Found:'  |
         sed 's/.*md5("\(.*\)").*<\/div>/\1/' )"

        echo "${r}"
}

# rot - cifra a string com a Cifra de César
rot()
{
	local n

	test $# -eq 2 || return 1

	# n recebe o caractere do alfabeto correspondente
	n=$(echo -e \\x$(dec2hex $(echo -e $((97+$1)))))

	# rot com o tr
	echo $2 | tr a-z $n-za-z | tr A-Z ${n^^}-ZA-Z
}

rotall()
{
	test -n "$1" || return 1

	for ((i=1; i<=25; i++ )); do
		echo "ROT$i $(rot $i "$1")"
	done
}

# aliases para funções mais comuns de ROT
alias rot5='rot 5'
alias rot13='rot 13'
alias rot18='rot 18'
alias rot47='rot 47'

# strxor - faz o xor de uma string com uma chave
strxor()
{
	local str
	local xored

	# $2 é a string e $1 é a chave
	str=$(str2hex "$2")

	for i in $str; do
		xored="$xored $(dec2hex $((0x$i^$1)))"
	done

	hex2str "$xored"
}

ip2bin()
{
	local r
	r=$(echo $1 | tr . \;)

	(for i in $(echo "obase=2;$r" | bc); do printf '%.8d.' $i; done) | sed 's/.$//'
	echo
}

####################### Geo Coordenadas de um determinado IP ##########
geoip()
{
        wget -q --timeout=30 "http://xml.utrace.de/?query=$1" -O - | sed '4d' | sed "s/<[^>]*>//g; s/\t//g; /^$/d" | tr '\n' ',' ; echo "\n"
       
}

####################### Imprime o IP externo da conexao ##############
meuip()
{
	wget -q --timeout=30 "http://meuip.datahouse.com.br/" -O - | 
	grep "Meu IP\?" | 
	grep -Ewo "([0-9]){1,3}(\.([0-9]){1,3}){3}"

}

####################### Scan de Redes Sem Fio ########################
wscan() 
{
	[ $# -ne 1 ] && echo "Informe uma interface EX: ./wscan wlan0 "

        iface=$1
        LISTA=""

	echo -e "BSS\t\t\t  dBm\t ESSID\t\t\t C?  \t WPS?"

	LISTA=($(iw dev ${iface} scan | 
              grep -Ewo "BSS (([a-f|0-9][a-f|0-9]\:){5}([:a-f|0-9]+)|channel ([0-9]){1,2})|SSID: ([0-9a-zA-Z]){1,}|([0-9]+)\.00 dBm|WPA.*|WEP|WPS.*" |
                tr '\n' ' ' | 
                sed 's/SSID: //g; s/channel //g; s/dBm/\t\n/g;  s/BSS/|/g; s/Version://g; s/\*//g;' 2>/dev/null ) )

	echo -e "${LISTA[@]}" | tr '|' '\n' | sed 's/: //g' |
                awk '{  n=""
                        for ( i=length($3) ; i<22 ; i++ ) n=n" "                
                          print $1,"\t",$2,"\t",$3,n,$4,"   "$5 
                        }'
	echo " "

}

####################### Brute force htaccess ##########################
bfhtpass() 
{
	wget --http-user=$1 --http-password=$2 -O - "$3" 2>/dev/null
        if [ $? -eq 0 ]
        then
                echo -e "\n\nSucesso!\n Usuario: $1 - Senha: $2\n" 
		[ -f $4 ] && echo -e "\n\nSucesso!\n Usuario: $1 - Senha: $2\n" > $4
		break 
        fi
}

bfht()
{
        local CONTADOR=0
        local u
        local USER
        local HOST
        local PASS
        local p
        local FLAGH
        local T=5
        local TMP=$(mktemp)
        local VERBOSE=0

        while (($#))
        do
                case $1 in
                "-u"|"-U")
                        [ $1 == "-U" ] && { shift ; USER="$1" ; }
                        [ $1 == "-u" ] && { USER=$(mktemp) ; shift ; echo $1 > ${USER} ; }
                ;;
                "-p"|"-P")
                        [ $1 == "-P" ] && { shift ; PASS="$1" ; }
                        [ $1 == "-p" ] && { PASS=$(mktemp) ; shift ; echo $1 > ${PASS} ; }
                ;;
                "-h")
                        shift
                        HOST="$1"
                ;;
                "-t")
                        shift
                        [ ! -z $1 ] && T=$1 || T=5
                ;;
                "-v")
                        VERBOSE=1
                ;;
                esac
                shift
        done

        while read u
        do
                test $( wc -l < ${TMP} ) -ne 0 && break
                while read p
                do
			test $( wc -l < ${TMP} ) -ne 0 && break
			[ ${VERBOSE} -eq 1 ] && echo -e "[ ${HOST} ] Usuario: ${u} \t Senha: ${p} "
			( bfhtpass "${u}" "${p}" "${HOST}" "${TMP}" >&2 /dev/null & )
			let CONTADOR++
			if [ ${CONTADOR} -eq ${T} ]
			then
				wait
				CONTADOR=0
				sleep 2
			fi
                done < ${PASS}
        done < ${USER}

}

####################### Engenharia Social  ###########################
websearch() 
{
	[ $# -le 1 ] && { echo -e "Modo de Usar: \nwebsearch [mail|file] <dominio.com.br> [sql|txt|...] [PAGINACAO Ex: 100 | default 50] " ; PGTOTAL=0 ; } 

	local PGTOTAL
        local TMP="$(mktemp)"
        #local DOMAIN="$( echo $2 | sed 's/\./\\./g')"
	local DOMAIN="$2"
        local AGENT="Mozilla/5.0"
	local PESQUISA
	local EXT 
	local LOCALIZAR

	case $1 in
	
		"mail") 
			PESQUISA="%22@${DOMAIN}%22" 
			[ "$( isnumber $3 )" == "TRUE" ] && 
			[ $3 -gt 0 ] &&  PGTOTAL=$3 ||
					 PGTOTAL=50
			LOCALIZAR="grep -Ewo ([a-z0-9_\.\-]){1,}\@${DOMAIN} "

		;;
		"file")
			EXT=$3
			PESQUISA="site:${DOMAIN}%20filetype:${EXT}"
			[ "$( isnumber $4 )" == "TRUE" ] && 
			[ $4 -gt 0 ] &&  PGTOTAL=$4 ||
					 PGTOTAL=50
		;;
	esac

	# DOMAIN = dominio ex: mentebinaria.com.br 
	# recebe como parametro as paginas que deseja percorrer
	# lembrando que a paginacao do google eh numerado de 10 em 10 

        echo "$1 $2"

        for (( i=0 ; i<=${PGTOTAL} ; i+=10 ))
        do
                echo "[+] ${i}"
                wget -q --timeout=30 --user-agent="${AGENT}" -O -  "http://www.google.com.br/search?q=${PESQUISA}&btnG=&start=${i}" &>> ${TMP}
        done

        echo "============================================="

	if [ $1 == "mail" ] 
	then 
		 cat ${TMP} | sed -e "s/<[^>]*>//g" | ${LOCALIZAR} 
	elif [ $1 == "file" ] 
	then
		 cat ${TMP} | sed -e "s/<[^>]*>/ /g" | grep -Ewo "${DOMAIN}\/.*.${EXT} " | tr ' ' '\n' | grep "${EXT}$" | sort -u
	fi

        rm -rf ${TMP}
}

####################### Engenharia Reversa ###########################

# asmgrep - busca instruções assembly em binários executáveis
asmgrep() { objdump -d "$2" | grep --color -C 4 -E "$1"; }

dumpmem()
{
	local stack_addr=$(grep -m 1 "$1" /proc/$2/maps |
	 cut -d' ' -f1 | sed 's/^/0x/; s/-/ 0x/')

	test -n "$stack_addr" && \
	echo "dump memory "$3" $stack_addr" | gdb --pid $2 &> /dev/null
}

alias dumpstack='dumpmem stack'
alias dumpheap='dumpmem heap'

# asminfo - busca informações sobre a instrução em assembly desejada
asminfo()
{
	local ins=${1,,}

	checkdir

	if test -s $hf_cache/$ins.txt; then
		cat $hf_cache/$ins.txt
	else
		wget -q faydoc.tripod.com/cpu/$ins.htm -O - |
		 html2text |
		 sed -n '/^===.*/,$p' |
		 sed 's/^===.*/'${ins^^}'/' | tr _ ' ' |
		 tee -a $hf_cache/$ins.txt
	fi

	test -s $hf_cache/$ins.txt || rm -f $hf_cache/$ins.txt
}

sc2asm()
{
	local mode=32
	local in="$1"

	[ $1 = '-m' ] && mode=$2 in="$3"

	sc=$(echo "$in" | sed 's/\\x/ /g')
	echo "$sc" | udcli -$mode -x -noff -nohex | sed 's/^ //'
}

asm2sc()
{
	local obj=$(mktemp)
	local fmt=elf32
	local in="$1"

	[ $1 = "-f" ] && fmt=$2 in="$3"

	nasm -f $fmt -o $obj $in 

	objdump -M intel -D $obj |
	 tr -d \\t |
	 sed -nr 's/^.*:(([0-9a-f]{2} )*).*$/\1/p' | 
	 tr -d \\n |
	 sed 's/\(..\) /\\x\1/g'

	echo
	rm -f $obj
}

########################### Cálculo ##################################

# xor - efetua xor (ou exclusivo) bit a bit entre dois números
xor() { echo $(($1^$2)); }

# shl - efetua deslocamento de bits à esquerda em um número
shl() { echo $(($1<<$2)); }

# shr - efetua deslocamento de bits à direita em um número
shr() { echo $(($1>>$2)); }

# pow - eleva um número à uma potência
pow() { echo $(($1**$2)); }

# hexcalc - faz operaçãos entre dois números hexa
hexcalc()
{
	test $# -eq 3 || return 1

	echo -n 0x
	dec2hex $((0x${1#0x} $2 0x${3#0x}))
}


#################### Configurações úteis ##############################

# habilita/desabilita sintaxe Intel automática no gdb e objdump
intel()
{
	local	GDBINIT="$HOME/.gdbinit"

	if [ "$1" == "on" ]; then
		grep -s 'disassembly-flavor' "$GDBINIT" &> /dev/null || \
		 echo "set disassembly-flavor intel" >> "$GDBINIT"
		alias gdb='gdb -q'
		alias objdump='objdump -M intel-mnemonics'
	elif [ "$1" == "off" ]; then
		sed -i 's/set disassembly-flavor intel//' "$GDBINIT"
		unalias objdump
		unalias gdb
	fi
}

