#!/bin/bash
source ./functions.sh

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
echo "zsh-newuser-install() { :; }" >> /etc/zsh/zshenv
echo "ADD YAY"
cd /root
cp -r /root/* /home/$USR
cd /home/$USR
su $USR
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -sif --noconfirm
cd ..
echo "INSTALL PACKEAGES FROM FILE"
yay -S --needed - < default --noconfirm
# cat dconf-settings.ini | dconf load /
create_symbolic_links
# code --list-extensions | xargs -L 1 echo code --install-extension
echo "INSTALL VSCODE EXTENSIONS"
cat extensions | xargs -L 1 code --install-extension
echo "INSTALL FZF"
git clone --depth 1 https://github.com/junegunn/fzf.git .fzf
~/.fzf/install
echo "INSTALL ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
