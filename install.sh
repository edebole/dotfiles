#!/bin/bash
source ./functions.sh

USR='edebole'
blue "UPGRADE SYSTEM"
pacman-key --init
pacman -Syuu --noconfirm
pacman -S sudo fakeroot zsh git go base-devel vim --noconfirm
blue "ADD USER; Enter a password and press CTRL + D"
useradd -m $USR -s /bin/zsh
echo '%wheel ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
usermod -aG wheel $USR
passwd $USR
echo "zsh-newuser-install() { :; }" >> /etc/zsh/zshenv
cd /root
cp -r /root/* /home/$USR
chown -R $USR:$USR /home/$USR
cd /home/$USR
su $USR && su - $USR -c "bash ./user_install.sh"
