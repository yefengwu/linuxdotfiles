if status is-interactive
    set -g fish_greeting
    source (/usr/bin/starship init fish --print-full-init | psub)
    # Commands to run in interactive sessions can go here
    zoxide init fish | source
    [ -f $HOME/.config/fish/aliases.fish ] && source $HOME/.config/fish/aliases.fish
end
