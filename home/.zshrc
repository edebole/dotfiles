export LANG=en_US.UTF-8
export LC_MESSAGES="C"
export ZSH="/home/$USER/.oh-my-zsh"
export PATH="$HOME/.rbenv/bin:$PATH"
#export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
export EDITOR="vim"
export SERVER_MAC="00:1f:c6:af:da:b9"
export UPDATE_ZSH_DAYS=7
ZSH_THEME="spaceship"
SPACESHIP_DIR_TRUNC=6

plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
	colored-man-pages
)

source $ZSH/oh-my-zsh.sh
alias SDN="sudo shutdown now"
alias SR="sudo reboot"
alias SS="sudo systemctl"
alias yt="youtube-dl --add-metadata -ic" # Download video link
alias yta="youtube-dl --add-metadata -xic" # Download only audio link
alias myip="curl ipinfo.io"
alias cp="cp -i"
alias mv="mv -i"
alias vim="nvim"
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias weather="curl wttr.in/La_Plata"
alias wifi="nmtui"
alias wifiup="nmcli r wifi on"
alias wifidown="nmcli r wifi off"
alias connect="nmcli c up"
alias disconnect="nmcli c down"
alias open="xdg-open"
alias d="docker"
alias dc="docker-compose"
alias ps="ps auxf"
alias cat="ccat"
alias sz="source ~/.zshrc"
alias rcon="python ~/git/cs1.6-server-docker/socket/rcon.py"
alias ls="exa -lhg --color=always --group-directories-first"
alias la="ls -lah"
alias cleanup="sudo pacman -Rns $(pacman -Qtdq)"
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias jctl="journalctl -p 3 -xb"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(rbenv init -)"
