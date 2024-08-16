if status is-interactive
    set -g fish_greeting
    set -gx EDITOR nvim
    fish_add_path $HOME/.nix-profile/bin /nix/var/nix/profiles/default/bin /run/system-manager/sw/bin/ /nix/var/nix/profiles/default/bin /home/linuxbrew/.linuxbrew/bin
    fish_add_path $HOME/.local/share/miniconda3/bin
    set -x HOMEBREW_BREW_GIT_REMOTE https://mirrors.ustc.edu.cn/brew.git
    set -x HOMEBREW_CORE_GIT_REMOTE https://mirrors.ustc.edu.cn/homebrew-core.git
    set -x HOMEBREW_BOTTLE_DOMAIN https://mirrors.ustc.edu.cn/homebrew-bottles
    set -x HOMEBREW_API_DOMAIN https://mirrors.ustc.edu.cn/homebrew-bottles/api
    source (starship init fish --print-full-init | psub)
    # Commands to run in interactive sessions can go here
    zoxide init fish | source
    [ -f $HOME/.config/fish/aliases.fish ] && source $HOME/.config/fish/aliases.fish
end
