# starship
starship init fish | source

# tmux
if command -v tmux &> /dev/null && [ -z "$TMUX" ];
  tmux attach-session -t default || tmux new-session -s default
end

# vi mode (cursors + default mode)
set -g fish_vi_force_cursor true
fish_vi_key_bindings default
function back_to_normal --on-event fish_prompt
	fish_vi_key_bindings "default"
end
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore
set fish_cursor_external line
set fish_cursor_visual block

# settings
set -g fish_autosuggestion_enabled 0
set -g fish_greeting

# ZSH auto start tmux
#if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#  tmux attach-session -t default || tmux new-session -s default
#fi
