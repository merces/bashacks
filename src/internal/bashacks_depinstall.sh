bashacks_depinstall()
{
    [ ${EUID} -eq 0 ] && {
        local sPktManager
        local sPkt='gcc make html2text iw nasm gdb wget'
        local sPathFile
        local sPwd=$(pwd)
        local sUdis=$(which udisks)

        # debian family
        [ -e '/etc/debian_version' ] &&
            sPktManager="apt-get install -y -qq"
        # OpenSuSE
        [ -e '/etc/SuSE-release' ] &&
            sPktManager="zypper -q --non-interactive install"
        # centos, fedora or redhat
        [ -e '/etc/redhat-release' -o \
            -e '/etc/centos-release' -o \
            -e '/etc/fedora-release' ] &&
            sPktManager="yum -q -y install"

        echo '[ Dep install ] ...'
        ${sPktManager} ${sPkt}

        [ -z "${sUdis}" ] && {
            cd /tmp
            echo '[ Download udis86 ] ...'

            # prevent corrupt file
            [ -e '/tmp/download' ] &&
                rm /tmp/download

            wget http://sourceforge.net/projects/udis86/files/latest/download &> /dev/null
            tar -xf /tmp/download 
            sPathFile=$(ls -1 | grep 'udis86')
            cd ${sPathFile}
            ./configure &&
                make &&
                make install &&
                    cd udcli &&
                        make &&
                        make install
        } || echo "[ udis86 already installed on the system ]"

        [ $? -eq 0 ] && {
            echo
            echo -n '=====    [ OK ]'
            echo
            cd ${sPwd}
            return 0
        }
    } || echo "root is required"
    return 1
}
