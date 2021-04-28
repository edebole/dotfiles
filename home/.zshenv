export LANG=en_US.UTF-8
export LC_MESSAGES="C"
export ZSH="/home/$USER/.oh-my-zsh"
export PATH="$HOME/scripts/bin:$PATH"
export EDITOR="nvim"
export SERVER_MAC="00:1f:c6:af:da:b9"
export UPDATE_ZSH_DAYS=7
export FZF_COMPLETION_TRIGGER='**'
export FORGIT_NO_ALIASES="true"
export MANPAGER="nvim -R -c 'set ft=man nomod nolist' -"
export FZF_COMPLETION_TRIGGER='__'
export FZF_DEFAULT_OPTS="
--layout=reverse
--multi
--color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008'
--prompt='∼ ' --pointer='▶' --marker='✓'
"
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
RUBIES+=(~/.rubies/*)
