#!/bin/bash
#
# hack-functions.sh - bash functions to do little hacks
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

##-------------------------------------------------- conversão de base

# dec2hex <numero_decimal>
# converte um número inteiro decimal para hexadecimal
#
# $ dec2hex 10
# a
function dec2hex
{
	arg=$1

	printf "%x\n" $arg
}

# hex2dec <numero_hexa>
# converte um número em hexa para decimal
#
# $ hex2dec 0x41
# A
function hex2dec()
{
	arg=$1

	# remove o prefixo '0x', caso exista
	arg=${arg#0x}
	echo $((0x$arg))
}

# dec2bin <numero>
# converte decimal para binário
#
# $ dec2bin 255
# 11111111
function dec2bin
{
	arg=$1
	echo "obase=2;$arg" | bc;
}

##-------------------------------------------------- conversão de caracteres e strings

# hex2asc <numero_hexa>
# converte um número em hexa para seu
# equivalente *imprimível* (>=32 e <=126) em ASCII
#
# $ hex2asc 0x97
# a
function hex2asc()
{
	arg=$1

	arg=${arg#0x}

	# imprime a representação ASCII
	echo -e "\x$arg"
}

# asc2dec <caractere>
# converte um caractere em seu equivalente decimal na tabela ASCII
#
# $ asc2dec F
# 70
function asc2dec
{
	arg=$1

	printf "%d\n" "'$arg"
}

# dec2asc <numero>
# converte um número decimal para seu caractere equivalente em ASCII
#
# $ dec2asc 70
# F
function dec2asc
{
	arg=$1

	echo -e $(printf "\\\x%x" $arg)
}

# str2hex <string>
# converte uma string para bytes hexa separados por espaço
#
# $ str2hex "ABC"
# 41 42 43
function str2hex
{
	arg=$1
	echo -n "$arg" | hexdump -v -e '/1 "%02x "'
	echo
}

# hex2str <bytes_hexa>
# converte uma string hexa (bytes separados por espaço) em uma string de texto
# onde os bytes podem ser precedidos por 0x ou não
#
# $ hex2str "41 42 0x43 44 0x45"
# ABCDE
function hex2str
{
	arg=$1
	aux=

	# remove todos os '0x', se houver
	arg=$(echo $arg | sed 's/0x//g')

	# prefixa os bytes hexa com '\x' (necessário para o echo)
	for i in $arg; do
		aux="$aux\\x$i"
	done

	echo -e $aux
}

function asciitable
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

##-------------------------------------------------- criptografia

# unbase64 <string>
# decodifica base64 numa string
#
# $ unbase64 RmVybmFuZG8=
# Fernando
function unbase64
{
	arg=$1

	echo $arg | base64 -d
	echo
}

# md5 <string|arquivo>
# gera o hash MD5 de uma string (sem considerar o caracetere de nova linha)
# ou de um arquivo, se existir
#
# $ md5 "123456"
# e10adc3949ba59abbe56e057f20f883e
#
# $ md5 /etc/passwd
# 18186ca65c92ba40cfe8ed4089496c42
function md5
{
	arg=$1

	test -e $arg && \
	md5sum < $arg | cut -d' ' -f1 || \
	echo -n $arg | md5sum | cut -d " " -f1
}

# unmd5 <hash>
# tenta descobrir a string que gerou
# o hash md5 usando as rainbow tables do
# site md5crack.com, com ajuda do cURL
# para efetuar o POST
#
# $ unmd5 e10adc3949ba59abbe56e057f20f883e
# 123456
function unmd5
{
	arg=$1
	site="http://md5crack.com/crackmd5.php"

	curl -s -d "term=$arg" "$site" | grep 'Found:' \
	| sed 's/.*md5("\(.*\)").*<\/div>/\1/'
}

# rot <deslocamento> <string>
# encripta/desencripta uma string str com a cifra
# de césar usando n deslocamentos para a direita
#
# $ rot 1 fernando
# gfsoboep
function rot
{
	test $# -eq 2 || return

	# número de deslocamentos em 'n'
	n=$1
	arg=$2

	# n recebe o caractere do alfabeto correspondente
	n=$(echo -e \\x$(dec2hex $(echo -e $((97+$n)))))

	# rot com o tr
	echo $arg | tr a-z $n-za-z | tr A-Z ${n^^}-ZA-Z
}

# aliases para os ROTs mais comuns
#
# $ rot13 linux
# yvahk
alias rot5='rot 5'
alias rot13='rot 13'
alias rot18='rot 18'
alias rot47='rot 47'

# strxor <chave> <string>
# calcula o ou exclusivo de cada caractere de uma
# string com a chave
#
# $ strxor 4 'ieikjew$ewwewwmjew'
# mamonas assassinas
function strxor
{
	key=$1
	arg=$2
	aux=

	arg=$(str2hex "$arg")

	for i in $arg; do
		aux="$aux $(dec2hex $((0x$i^$key)))"
	done

	hex2str "$aux"
}

##-------------------------------------------------- engenharia reversa

# asmgrep <regex> <executável>
# busca instruções assembly (sintaxe intel) em binários
# executáveis e imprime 4 instruções 'em volta'
#
# $ asmgrep 'push *rbp$' /bin/ls
# 411400:	41 57                	push   r15
# 411402:	41 56                	push   r14
# 411404:	41 55                	push   r13
# 411406:	41 54                	push   r12
# 411408:	55                   	push   rbp
# 411409:	53                   	push   rbx
# 41140a:	48 83 ec 68          	sub    rsp,0x68
# 41140e:	85 ff                	test   edi,edi
# 411410:	48 8b 9c 24 a0 00 00 	mov    rbx,QWORD PTR [rsp+0xa0]
function asmgrep()
{
	objdump -M intel-mnemonics -d "$2" | \
	grep --color -C 4 -E "$1"
}

##-------------------------------------------------- cálculo numérico

function xor { echo $(($1^$2)); }
function shl { echo $(($2<<$1)); }
function shr { echo $(($2>>$1)); }
function pow { echo "$1^$2" | bc; }

# hexcalc <numero_hexa> <+|-> <numero_hexa>
# soma ou subtrai dois números em hexadecimal
# e retorna o resultado na mesma base
#
# $ hexcalc 1f5 + 400000
# 4001f5
function hexcalc
{
	test $# -eq 3 || return

	arg1=$1
	op=$2
	arg2=$3

	test $op == "-" -o $op == "+" || return

	arg1=${arg1#0x}
	arg2=${arg2#0x}

	dec2hex $((0x$arg1 $op 0x$arg2))
}
