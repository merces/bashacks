bh_rot()
{
    local n

    test $# -eq 2 || return 1 

    # n recebe o caractere do alfabeto correspondente
    n=$(echo -e \\x$(bh_dec2hex $(echo -e $((97+$1)))))

    # rot com o tr
    echo $2 | tr a-z $n-za-z | tr A-Z ${n^^}-ZA-Z
}
