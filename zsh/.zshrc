# env
export EDITOR="nvim"

unsetopt beep

# plugins
autoload -Uz compinit && compinit
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
eval "$(starship init zsh)"

# options
HISTFILE=~/.history
HISTSIZE=10000
SAVEHIST=50000

ZVM_LINE_INIT_MODE=$ZVM_MODE_NORMAL

# auto start tmux
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux attach-session -t default || tmux new-session -s default
fi
