bh_hexcalc()
{
    local USAGE="Makes calculation of numbers in hexadecimal and gives the result in hexadecimal.\n
   bh_hexcalc <hex_number> <operator> <hex_number>\n
   Category  : Calc.\n
   Parameters:
        -h         :  Help.
        operator   :  +, -, * or /
        hex_number :  Decimal number or hex number (prefixed with '0x').\n
   Output:
   \$ bh_hexcalc 5f \* 2
   oxbee
   \$ bh_hexcalc 0xdead / 0xdead
   0x1"

	test $# -eq 3 || { echo -e "${USAGE}"; return 1; }

	echo -n 0x
	bh_dec2hex $((0x${1#0x} $2 0x${3#0x}))
}
