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

eval "$(rbenv init -)"
