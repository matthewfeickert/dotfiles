# .bash_profile
# Get the aliases and functions
if [ -f ~/.bashrc ]; then
      . ~/.bashrc
fi

# Add uv to PATH if it isn't already on PATH
if [ -f "${HOME}/.cargo/env" ]; then
    . "${HOME}/.cargo/env"
fi
