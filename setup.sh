#!/bin/bash

# Ensure matplotlib has font from cursive font family
# https://stackoverflow.com/q/65649122/8931942
if [ ! -d "${HOME}/.local/share/fonts/truetype/felipa" ]; then
    mkdir -p "${HOME}/.local/share/fonts/truetype/felipa"
    wget --no-clobber https://github.com/google/fonts/blob/master/ofl/felipa/Felipa-Regular.ttf?raw=true -O "${HOME}/.local/share/fonts/truetype/felipa/Felipa-Regular.ttf"
    if [ ! -d /usr/share/fonts/truetype/felipa ]; then
        sudo ln -s "${HOME}/.local/share/fonts/truetype/felipa" /usr/share/fonts/truetype/felipa
    fi
    fc-cache --force --verbose # force system font cache rebuild
fi

# Get keys for nvidia-container-runtime
# c.f. https://nvidia.github.io/nvidia-container-runtime/
# N.B.: Remember to: sudo systemctl restart docker
if [ ! -f /etc/apt/sources.list.d/nvidia-container-runtime.list ]; then
    sudo apt-get update
    curl -s -L https://nvidia.github.io/nvidia-container-runtime/gpgkey | \
        sudo apt-key add -
    distribution="$(. /etc/os-release;echo "${ID}${VERSION_ID}")"
    curl -s -L "https://nvidia.github.io/nvidia-container-runtime/${distribution}/nvidia-container-runtime.list" | \
        sudo tee /etc/apt/sources.list.d/nvidia-container-runtime.list
    sudo apt-get update
    unset distribution
fi
