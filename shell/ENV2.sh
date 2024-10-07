#!/bin//bash

##############################
# 1. $HOME/.bashrc
# 2. $HOME/.vimrc
# 3. ?
##############################

set -e

source /root/shell/functions.sh

echo "[$HOME/.bashrc]"

##############################
#1. $HOME/.bashrc
##############################
BASHRC=$HOME/bashrc.txt
#BASHRC=$HOME/.bashrc
echo "[phase 01] $BASHRC"
/bin/cp /etc/skel/.bashrc $BASHRC
cat << EOF >> $BASHRC
#
#specific configuration
#

alias FTP='cd /etc/vsftpd'
alias vsftpd.conf='vi /etc/vsftpd/vsftpd.conf'
alias ftpusers='vi /etc/vsftpd/ftpusers'
alias user_list='vi /etc/vsftpd/user_list'
alias slog='tail -f /var/log/secure'
alias flog='tail -f /var/log/xferlog'


EOF
echo "{   ok    }" 

echo "[$HOME/.vimrc]"
# 2. $HOME/.vimrc
VIMRC=$HOME/.vimrc
echo "[phase 01] $VIMRC"
cat << EOF >> $VIMRC
syntax on
set nu
set ai

