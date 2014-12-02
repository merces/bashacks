bh_rot()
{
     local USAGE="Encrypts/Decrypts string with the Cesar Cipher using n shifts to the right.\n
   bh_rot <displacement> <string>\n
   Category  : Crypto.\n
   Parameters:
        -h           : Help.
        displacement : The number of shifts to be applied to the string.
        string       : The stri
        ng that will undergo the ROT.\n
    Output:
    \$ bh_rot 1 'iron maiden'
    jspo nbjefo \n
    # simulando rotall()
    \$ for i in {1..8}; do echo -n \"rot\$i: \"; bh_rot $i 'ewlsd'; done
    rot1: fxmte
    rot2: gynuf
    rot3: hzovg
    rot4: iapwh
    rot5: jbqxi
    rot6: kcryj
    rot7: ldszk
    rot8: metal\n
    Note:
    This function has the aliases bh_rot5() bh_rot13() bh_rot18() and ROT47(), where the number 
    of displacements need not be entered because it is already in the function name."
    
    local n

    test $# -eq 2 || { echo -e "${USAGE}" ; return 1; }

    # n recebe o caractere do alfabeto correspondente
    n=$(echo -e \\x$(bh_dec2hex $(echo -e $((97+$1)))))

    # rot com o tr
    echo $2 | tr a-z $n-za-z | tr A-Z ${n^^}-ZA-Z
}
