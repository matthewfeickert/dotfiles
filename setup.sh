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
