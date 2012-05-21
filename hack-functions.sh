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


########################### Conversão de base ###########################

# dec2hex - converte decimal para hexadecimal
dec2hex() { printf "%x\n" "$1"; }

# hex2dec - converte hexadecimal para decimal
hex2dec() { echo $((0x${1#0x})); }

# dec2bin - converte decimal para binário
dec2bin() { echo "obase=2;$1" | bc; }

# bin2dec - converte binário para decimal
bin2dec() { echo $((2#$1)); }


################# Conversão de caracteres e strings #####################

# hex2asc - converte um número em hexa para seu equivalente em ASCII
hex2asc() { echo -e "\x${1#0x}"; }

# asc2hex - converte um caractere ASCII em hexadecimal
asc2hex() { printf "%x\n" "'$1"; }

# dec2asc - converte um número decimal para seu caractere equivalente em ASCII
dec2asc() { echo -e $(printf "\\\x%x" $1); }

# asc2dec - converte um caractere ASCII em decimal
asc2dec() { printf "%d\n" "'$1"; }

# str2hex - converte uma string para bytes em hexadecimal
str2hex()
{
	case "$1" in
		"-x")
			echo -n "$2" | hexdump -v -e '/1 "%02x"' | sed 's/../\\x&/g'
			echo
			;;
		"-0x")
			echo -n "$2" | hexdump -v -e '/1 "0x%02x "' | sed 's/\(.*\) /\1/'
			echo
			;;
		"-c")
			echo -n '{'
			echo -n "$2" | hexdump -v -e '/1 "0x%02x, "' | sed 's/\(.*\), /\1/'
			echo '}'
			;;
		*)
			echo -n "$1" | hexdump -v -e '/1 "%02x "' | sed 's/\(.*\) /\1/'
			echo
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
	site="http://md5crack.com/crackmd5.php"

	wget -q --timeout=30 --post-data="term=$1" "$site" -O - |
	 grep 'Found:'  |
	 sed 's/.*md5("\(.*\)").*<\/div>/\1/'
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


####################### Engenharia Reversa ###########################

# asmgrep - busca instruções assembly em binários executáveis
asmgrep() { objdump -d "$2" | grep --color -C 4 -E "$1"; }

# dumpstack(pid, outfile) - dumpa a pilha de memória do processo
dumpstack()
{
	local stack_addr=$(grep '\[stack\]' /proc/$1/maps |
								cut -d' ' -f1 | sed 's/^/0x/; s/-/ 0x/')
	
	test -n "$stack_addr" && \
	echo "dump memory "$2" $stack_addr" | gdb --pid $1 &> /dev/null
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
