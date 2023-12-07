if status is-interactive
    set -g fish_greeting
    set -gx EDITOR nvim
    fish_add_path $HOME/.nix-profile/bin /nix/var/nix/profiles/default/bin /run/system-manager/sw/bin/ /nix/var/nix/profiles/default/bin
    source (starship init fish --print-full-init | psub)
    # Commands to run in interactive sessions can go here
    zoxide init fish | source
    [ -f $HOME/.config/fish/aliases.fish ] && source $HOME/.config/fish/aliases.fish
end
