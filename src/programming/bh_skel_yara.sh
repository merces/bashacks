bh_skel_yara() {
    echo -e \
"rule test {
    meta:
        author = \"$(whoami)\"
        description = \"\"
        date = \"$(date +%Y-%m-%d)\"
        ref = \"\"
        hash = \"\"

    strings:
        \$a = \"test\" ascii wide

    condition:
        all of them
}"
}
