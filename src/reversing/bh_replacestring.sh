# bh_replacestring file string new_string
#
# example: bh_replacestring ./bin/ls 
#
# cp /bin/ls .
# chmod +x ./ls
#
# ./ls -l
# total 11608
# -rw-rw-r--  ...
#
# bh_replacestring ls total t0ta1
#
# $ ./ls -l
# t0ta1 11608
# -rw-rw-r--  ...
bh_replacestring() {
    [[ -f "$1" && -n "$2" && -n "$3" && "${#2}" == "${#3}" ]] || return 1

    local fil="$1"
    local src="$2"
    local dst="$3"

    local srchex=$(echo "$src" | xxd -pu)
    local dsthex=$(echo "$dst" | xxd -pu)

    local tmpfile=$(mktemp)

    # xxd -r -p works, while xxd -rp and xxd -pr don't O.o
    xxd -p $fil | tr -d \\n | sed "s/${srchex::-2}/${dsthex::-2}/g" | xxd -r -p >  $tmpfile
    
    [[ -s $tmpfile ]] && mv $tmpfile $fil
}
