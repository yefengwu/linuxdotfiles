# Standard and additional keybindings
#
# Find the key with: showkey -a
#
#   ctrl + u     : clear line
#   ctrl + w     : delete word backward
#   alt  + d     : delete word
#   ctrl + a     : move to beginning of line
#   ctrl + e     : move to end of line (e for end)
#   alt/ctrl + f : move to next word (f for forward)
#   alt/ctrl + b : move to previous word (b for backward)
#   ctrl + d     : delete char at current position (d for delete)
#   ctrl + k     : delete from character to end of line
#   alt  + .     : cycle through previous args

# Emacs style bindings (for Home/End keys...)
bindkey -e

# In menu completion, the Return key will accept the current selected match
# bindkey -M menuselect '^M' .accept-line

# shift-tab : go backward in menu (invert of tab
bindkey '^[[Z' reverse-menu-complete

# alt-x : insert last command result
zmodload -i zsh/parameter
insert-last-command-output() {
  LBUFFER+="$(eval $history[$((HISTCMD-1))])"
}
zle -N insert-last-command-output
bindkey '^[x' insert-last-command-output

# ctrl+b/f or ctrl+left/right : move word by word (backward/forward)
bindkey '^b' backward-word
# bindkey '^f' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^H' backward-kill-word
bindkey '^[[3;5~' kill-word
bindkey '^[[3~' delete-char
bindkey '^?' backward-delete-char

bindkey '^[OH' beginning-of-line
bindkey '^[OF' end-of-line

# Ctrl+space: print Git status
# bindkey -s '^ ' ' git status --short^M'

# Alt+~: run Git WTF script
function _git_wtf {
  echo
  git-wtf
  zle reset-prompt
}
zle -N _git_wtf
bindkey '^[`' _git_wtf

function fzf_open_files {
  nvim $(fzf --height 50% --preview 'bat --color=always {}' --preview-window '~3')
}
zle -N fzf_open_files

bindkey '^f' fzf_open_files

# Execute the current suggestion (using zsh-autosuggestions)
# Alt+Enter = '^[^M' on recent VTE and '^[^J' for older (Lxterminal)
bindkey '^[^M' autosuggest-execute
bindkey '^[^J' autosuggest-execute

# Disable the capslock key and map it to escape
# setxkbmap -option caps:backspace

# Disable flow control (ctrl+s, ctrl+q) to enable saving with ctrl+s in Vim
stty -ixon -ixoff

