ZSH_THEME="spaceship"

plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
	colored-man-pages
)

[ -f $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh

[ -f ~/.aliases ] && source ~/.aliases

[ -f ~/.zshenv ] && source ~/.zshenv

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -d /usr/share/chruby ] && source /usr/share/chruby/chruby.sh
[ -d /usr/share/chruby ] && source /usr/share/chruby/auto.sh
RUBIES+=(~/.rubies/*)
