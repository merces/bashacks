bashacks_depinstall() {
    local sPktManager=
    local sPkt="bc binutils coreutils file grep hexdump html2text perl sed wget zip"

    if which apt-get >/dev/null; then # Debian-like
        sPktManager="apt-get install -qqy"
    elif which zypper >/dev/null; then # SuSE-like
        sPktManager="zypper -q --non-interactive install"
    elif which yum >/dev/null; then # RedHat-like
        sPktManager="yum -qy install"
    elif which brew >/dev/null; then # OS X
        sPktManager="brew install"
    fi

    ${sPktManager} ${sPkt}
}