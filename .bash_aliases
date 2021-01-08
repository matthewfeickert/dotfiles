alias l='ls -lhF'

alias python=python3
alias system-python=/usr/bin/python3

alias open=xdg-open
alias specs=screenfetch
alias HUD=htop

alias cleanContainers='docker container prune'
alias cleanImages='docker image prune'

# cluster logins
alias lxplus='ssh -CX feickert@lxplus.cern.ch'
alias beastmode='ssh -CX feickert@beast.physics.illinois.edu'
alias atlasconnect='ssh -CX feickert@login.usatlas.org'

# tools

# https://github.com/saulpw/visidata
if [ -f "/usr/bin/vd" ]; then
    alias visidata='vd'
fi

# fun
alias advice='cowsay $(fortune) | lolcat'
