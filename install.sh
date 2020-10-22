#!/bin/bash
USR='edebole'
echo "UPGRADE SYSTEM"
pacman-key --init
pacman -Syuu --noconfirm
pacman -S sudo fakeroot zsh git go base-devel --noconfirm
echo "ADD USER"
useradd -m $USR -s /bin/zsh
echo '%wheel ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
usermod -aG wheel $USR
passwd $USR
echo "ADD YAY"
cd /root
cp -r /root/* /home/$USR
chown -R $USR:$USR /home/$USR
pacman-key --init
pacman -Syuu --noconfirm
pacman -S sudo fakeroot zsh git go base-devel --noconfirm
echo "ADD USER"
cd /home/$USR
su $USR
sudo -H -u edebole bash -c git clone https://aur.archlinux.org/yay-git.git
sudo -H -u edebole bash -c cd yay-git
sudo -H -u edebole bash -c makepkg -sif --noconfirm
cd ..
echo "INSTALL PACKEAGES FROM FILE"
sudo -H -u edebole bash -c yay -S --needed - < default --noconfirm
cat dconf-settings.ini | dconf load /
BASE_DIR=`pwd`
FILES=(`find home -type f`)
echo "CREATING SYMBOLIC LINKS"
for file in "${FILES[@]}"
do
  sudo -H -u edebole bash -c ln -nfs $BASE_DIR/${file} $HOME${file/home}
done
echo "INSTALL VSCODE EXTENSIONS"
sudo -H -u edebole bash -c cat extensions | xargs -L 1 code --install-extension
echo "INSTALL FZF"
sudo -H -u edebole bash -c git clone --depth 1 https://github.com/junegunn/fzf.git .fzf
sudo -H -u edebole bash -c ~/.fzf/install
echo "INSTALL ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo -H -u edebole bash -c git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
sudo -H -u edebole bash -c git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
sudo -H -u edebole bash -c git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
sudo -H -u edebole bash -c git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
