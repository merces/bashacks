bashacks_depinstall()
{
    local sPktManager=
    local sPkt='gcc make html2text iw nasm gdb wget'

    if which -s apt-get; then # Debian-like
        sPktManager="apt-get install -qqy"
    elif which -s zypper; then # SuSE-like
        sPktManager="zypper -q --non-interactive install"
    elif which -s yum; then # RedHat-like
        sPktManager="yum -qy install"
    fi

    ${sPktManager} ${sPkt}
}