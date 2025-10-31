function ycwd
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end
#some normal command
# system cmds
alias ci='chezmoi'
alias eo='/mnt/c/Windows/explorer.exe'
alias ip='ifconfig'
alias l='ls -lah'
alias la='ls -lAh'
alias lf='yazi'
alias ll='ls -alh'
alias md='mkdir -p'
alias po='popd'
alias ps='ps aux'
alias pu='pushd'
alias rd='rmdir'
alias sp='sudo apt update && sudo apt upgrade -y'
alias se='sudoedit'
alias vf='vimdiff'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# tools cmds
alias lg='lazygit'
alias lk='lazydocker'
alias vd='nvim -d'
alias vi='nvim'
alias z='__zoxide_z'
alias ze='zellij'
alias zi='__zoxide_zi'

# git 
alias gcl='git clone'
alias gst='git status'
alias gd='git diff'
alias gc='git checkout'
alias grv='git remote -v'
alias glg='git log --stat | less'

# docker cmds
alias da='docker attach'
alias di='docker images'
alias ds='docker ps -a --format "table {{.ID}}\t{{.Image}}\t{{.Names}}\t{{.Status}}"'
function de
    set -l container (docker ps --format "{{.Names}}" | fzf)
    if test -n "$container"
        docker exec -it $container /bin/bash
    end
end

function fzf_nvim
    set -l selected_files (fzf --height 50% --preview 'bat --color=always {}' --preview-window '~3')
    if test -n "$selected_files"
        nvim $selected_files
    end
end

function fish_user_key_bindings
    bind \cf fzf_nvim
end
