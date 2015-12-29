bashacks_depinstall()
{
    local sPktManager=
    local sPkt="bc binutils file grep hexdump html2text perl sed ssh-keygen wget zip"

    if which -s apt-get; then # Debian-like
        sPktManager="apt-get install -qqy"
    elif which -s zypper; then # SuSE-like
        sPktManager="zypper -q --non-interactive install"
    elif which -s yum; then # RedHat-like
        sPktManager="yum -qy install"
    elif which -s brew; then # OS X
        sPktManager="brew install"
    fi

    ${sPktManager} ${sPkt}
}