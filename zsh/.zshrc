# env
export EDITOR="nvim"

# options
HISTFILE=~/.history
HISTSIZE=10000
SAVEHIST=50000

unsetopt beep

# fixes
# precmd() { precmd() { echo "" } }
# alias clear="precmd() { precmd() { echo "" } }"

# plugins
autoload -Uz compinit && compinit
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
eval "$(starship init zsh)"
