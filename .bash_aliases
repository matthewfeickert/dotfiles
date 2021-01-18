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
alias bluewaters='ssh -CX feickert@bw.ncsa.illinois.edu'

# tools

# https://github.com/saulpw/visidata
if [ -f "/usr/bin/vd" ]; then
    alias visidata='vd'
fi

if [ -f "/usr/local/cuda/version.txt" ]; then
    alias cuda-version="cat /usr/local/cuda/version.txt"
elif [ -f "/usr/lib/cuda/version.txt" ]; then
    alias cuda-version="cat /usr/lib/cuda/version.txt"
fi

# fun
alias advice='cowsay $(fortune) | lolcat'
