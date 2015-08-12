#!/bin/bash -e

help="Usage:\n\n$0 <samba netbios name> <vagrant user samba password>"

if [ -n "$1" ]
then
    echo "Samba netbios name: $1"
    SMB_NETBIOS_NAME=$1
else
    echo -e $help
    exit 1
fi

if [ -n "$2" ]
then
    echo "Samba password: $2"
    SMB_PASSWD=$2
else
    echo -e $help
    exit 1
fi

set -x

apt-get update
apt-get -y install samba
# So we can redirect output as root
/bin/bash -c "sed s/developervm/$SMB_NETBIOS_NAME/ /smb.conf > /etc/samba/smb.conf"
restart smbd
restart nmbd

/bin/bash echo -e "$SMB_PASSWD\$SMB_PASSWD\n" | smbpasswd -a -s

mkdir -p /repos

set +x
echo ""
echo "Samba file server installation done. On your windows machine, map a network drive to: \\\\$SMB_NETBIOS_NAME\repos"
