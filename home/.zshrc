ZSH_THEME="spaceship"

plugins=(
  aliases
  git
  rbenv
  ruby
  zsh-syntax-highlighting
  zsh-autosuggestions
  colored-man-pages
  zsh-git-fzf
)

[ -f $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh

[ -f ~/.aliases ] && source ~/.aliases

[ -f ~/.zshenv ] && source ~/.zshenv

[ -f ~/.functions ] && source ~/.functions

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f ~/git/forgit/forgit.plugin.sh ] && source ~/git/forgit/forgit.plugin.sh
