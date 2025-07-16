if status is-interactive
    set -g fish_greeting
    set -gx EDITOR nvim
    fish_add_path /home/linuxbrew/.linuxbrew/bin
    if string match -q "*WSL2*" (uname -r)
        fish_add_path /mnt/c/users/xuwei/AppData/local/Programs/Microsoft\ VS\ Code/bin/
    end
    set -x HOMEBREW_BREW_GIT_REMOTE https://mirrors.ustc.edu.cn/brew.git
    set -x HOMEBREW_CORE_GIT_REMOTE https://mirrors.ustc.edu.cn/homebrew-core.git
    set -x HOMEBREW_BOTTLE_DOMAIN https://mirrors.ustc.edu.cn/homebrew-bottles
    set -x HOMEBREW_API_DOMAIN https://mirrors.ustc.edu.cn/homebrew-bottles/api
    set -x PUID $(id -u)
    set -x PGID $(id -g)
    source (starship init fish --print-full-init | psub)
    # Commands to run in interactive sessions can go here
    zoxide init fish | source
    [ -f $HOME/.config/fish/aliases.fish ] && source $HOME/.config/fish/aliases.fish

    # bindkey
    bind \b backward-kill-word
end

function lf
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end
function ze 
    cd (zoxide query -i) 
end
