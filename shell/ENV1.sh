#!/bin//bash

# 1. telnet 
# 2. vsftped
# 3. ?

source /root/shell/functions.sh

##############################
#1. telnet service
# 1) telnet-server, telnet
PKGS="telnet-service telnet"
echo "[phase 01] $PKG"
PkgInstall $PKGS
# 2) telnet.socket
SVCS= "telnet.socket"
echo "[phase 02] $SVCS"
SerciceStart $SVCS
#3)telnet
RULES="telnet"
echo"[phase 03] $RULES"
FWRule $RULES

echo
##############################
PKGS="telnet-service telnet"
echo "[phase 01]"
PkgInstall $PKGS


##############################
#2. vsftpd service
#1) vsftp. ftp
PKGS="vsftpd ftp"
echo "[phase 01] $PKGS"
PkgInstall $PKGS
#2) /etc/vsftpd/ {ftpusers,user_list}
FTPUSERS=/etc/vsftpd/user_list
USER_LIST=/etc/vsftpd/user_list
echo "[phase 02] $FTPUSERS $USER_LIST"
for i in $FTPUSERS $USER_LIST
do  sed -i 's/^root/#root/' $i
done
echo "{   ok    }" 
#3) vsftpd.service 
SVCS= "vsftpd.service"
echo "[phase 03] $SVCS"
SerciceStart $SVCS
#4) ftp
RULES="ftp"
echo"[phase 04] $RULES"
FWRule $RULES
##############################