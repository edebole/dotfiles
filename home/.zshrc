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

[ -f ~/.fzf-tab/fzf-tab.plugin.zsh ] && source ~/.fzf-tab/fzf-tab.plugin.zsh

[ -f ~/git/forgit/forgit.plugin.sh ] && source ~/git/forgit/forgit.plugin.sh

[ -d /usr/share/chruby ] && source /usr/share/chruby/chruby.sh

[ -d /usr/share/chruby ] && source /usr/share/chruby/auto.sh
