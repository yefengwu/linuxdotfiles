#some normal command
# system cmds
alias ci='chezmoi'
alias ip='ifconfig'
alias l='ls -lah'
alias la='ls -lAh'
alias lf='joshuto'
alias ll='ls -alh'
alias md='mkdir -p'
alias po='popd'
alias ps='ps aux'
alias pu='pushd'
alias rd='rmdir'
alias sp='sudo apt update && sudo apt upgrade -y'
alias vf='vimdiff'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# tools cmds
alias bat='batcat'
alias lg='lazygit'
alias lk='lazydocker'
alias vd='nvim -d'
alias vi='nvim'
alias z='__zoxide_z'
alias ze='zellij'
alias zi='__zoxide_zi'

# docker cmds
alias da='docker attach'
alias di='docker images'
alias ds='docker ps -a --format "table {{.ID}}\t{{.Image}}\t{{.Names}}\t{{.Status}}"'
function de
    docker exec -it $argv[1] /bin/bash
end

