#!/usr/bin/env bash
###################################################################################################
#																																														   	  #
#	Script para adicionar um ipset que bloqueia pais(es) especificado(s) nos parametros						  #
#																																													   		  #
#	Desenvolvido por Duilio Beojone Neto - 18/12/2017			    		 			        										#
#												 																																					#
#	Versão 1.5																																										 	#
#										   		 																																				#
# Melhorias a fazer:																																							#
# - Melhorar o sed na func criaset() // redes menores que 256 hosts																#
# - Trabalhar também com ipv6																																			#
# - bloquear a rede TOR																																						#
# - verificar se os arquivos fornecidos pela arin e afrinc ainda apresentam erros (culpa deles)		#
#																																																	#
###################################################################################################

comeca () {
	clear
	echo -e "\n\n\nCriando as regras para bloquear: ${@^^}\n"
	for i in $@
	do

	 echo $i | grep -Ei "gd|py|co|ve|cl|sr|bo|ec|gf|ar|gy|br|pe|uy|fk" > /dev/null 2>&1
         [ $? -eq 0 ] && baixaefiltra $i lacnic && continue

         echo $i | grep -Ei "SX|BQ|CW|AG|AI|AN|AW|BB|BL|BM|BS|BZ|CA|CR|CU|DM|DO|GD|GL|GP|GT|HN|HT|JM|KN|KY|LC|MF|MQ|MS|MX|NI|PA|PM|PR|SV|TC|TT|US|VC|VG|VI" > /dev/null 2>&1
         [ $? -eq 0 ] && baixaefiltra $i arin && continue

         echo $i | grep -Ei "AE|AF|AM|AP|AZ|BD|BH|BN|BT|CC|CN|CX|CY|GE|HK|ID|IL|IN|IO|IQ|IR|JO|JP|KG|KH|KP|KR|KW|KZ|LA|LB|LK|MM|MN|MO|MV|MY|NP|OM|PH|PK|PS|QA|SA|SG|SY|TH|TJ|TL|TM|TW|UZ|VN|YE" > /dev/null 2>&1
         [ $? -eq 0 ] && baixaefiltra $i apnic && continue

         echo $i | grep -Ei "AO|BF|BI|BJ|BW|CD|CF|CG|CI|CM|CV|DJ|DZ|EG|EH|ER|ET|GA|GH|GM|GN|GQ|GW|KE|KM|LR|LS|LY|MA|MG|ML|MR|MU|MW|MZ|NA|NE|NG|RE|RW|SC|SD|SH|SL|SN|SO|ST|SZ|TD|TG|TN|TZ|UG|YT|ZA|ZM|ZW" > /dev/null 2>&1
         [ $? -eq 0 ] && baixaefiltra $i afrinic && continue

         echo $i | grep -Ei "AD|AL|AT|AX|BA|BE|BG|BY|CH|CZ|DE|DK|EE|ES|EU|FI|FO|FR|FX|GB|GG|GI|GR|HR|HU|IE|IM|IS|IT|JE|LI|LT|LU|LV|MC|MD|ME|MK|MT|NL|NO|PL|PT|RO|RS|RU|SE|SI|SJ|SK|SM|TR|UA|VA" > /dev/null 2>&1
         [ $? -eq 0 ] && baixaefiltra $i ripencc && continue

         echo $i | grep -Ei "AS|AU|CK|FJ|FM|GU|KI|MH|MP|NC|NF|NR|NU|NZ|PF|PG|PN|PW|SB|TK|TO|TV|UM|VU|WF|WS" > /dev/null 2>&1
         [ $? -eq 0 ] && baixaefiltra $i apnic && continue

	done
}

baixaefiltra () {
	a=${1^^}
	echo -e "\nBloqueando $a"

	lacnic="http://ftp.lacnic.net/pub/stats/lacnic/delegated-lacnic-extended-latest"
	arin="https://ftp.arin.net/pub/stats/arin/delegated-arin-extended-latest"
	apnic="https://ftp.apnic.net/stats/apnic/delegated-apnic-extended-latest"
	afrinic="ftp://ftp.afrinic.net/pub/stats/afrinic/delegated-afrinic-extended-latest"
	ripencc="http://ftp.ripe.net/pub/stats/ripencc/delegated-ripencc-extended-latest"

	#echo delegated-$2-extended-latest
	#echo ${!2}

	[ -f delegated-$2-extended-latest ] ||  { echo "Obtendo arquivo referencial"; wget --quiet ${!2} ; } || { echo "Não foi possivel obter arquivo referencial"; exit 33; }

	grep -F $(echo ${a^^}) delegated-$2-extended-latest | grep -Fv -e asn -e ipv6 -e allocated > ipv4$a

	criaset $a
}

criaset () {
	a=${1^^}
	echo "Criando set para $a"

	sed 's/|/ /g' ipv4$a | awk '{print $4$5}' | sed -e 's/256/\/24/' -e 's/512/\/23/' -e 's/1024/\/22/' -e 's/2048/\/21/' -e 's/4096/\/20/' -e 's/8192/\/19/' -e 's/16384/\/18/' -e 's/32768/\/17/' -e 's/65536/\/16/' -e 's/131072/\/15/' -e 's/262144/\/14/' -e 's/524288/\/13/' -e 's/1048576/\/12/' -e 's/2097152/\/11/' -e 's/4194304/\/10/' -e 's/8388608/\/9/' -e 's/16777216/\/8/' > Redes$a.txt

        ipset create "$a-net" hash:net 2>/dev/null
        ipset flush "$a-net"

        while IFS= read -r rede; do
		ipset add "$a-net" $rede
	done < Redes$a.txt

        rm ipv4$a
        rm Redes$a.txt

	iptables -t filter -I INPUT -m set --match-set "$a-net" src -j DROP

	echo "$a bloqueado"
}

[[ $(which ipset) ]] || { clear; echo -e "\n\nIPSet não encontrado\n\n" ; exit 33; }
[[ $1 ]] && comeca $@ || echo "uso $0 SiglaPais ex: $0 CN BR AU"

rm delegated-ripencc-extended-latest delegated-afrinic-latest delegated-apnic-extended-latest delegated-arin-extended-latest delegated-lacnic-latest 2>/dev/null
