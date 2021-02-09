#!/bin/bash
source ./functions.sh

USR='edebole'
blue "ADD YAY"
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -sif --noconfirm
cd ..
blue "INSTALL PACKEAGES FROM FILE"
yay -S --needed - < ./packages --noconfirm # NEED FIX
# cat dconf-settings.ini | dconf load /
# code --list-extensions | xargs -L 1 blue code --install-extension
blue "INSTALL VSCODE EXTENSIONS"
cat extensions | xargs -L 1 code --install-extension
blue "INSTALL FZF"
git clone --depth 1 https://github.com/junegunn/fzf.git .fzf
~/.fzf/install --all
blue "INSTALL ZSH; press CTRL + D"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ZSH_CUSTOM="/home/$USR/.oh-my-zsh/custom"
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
create_symbolic_links
