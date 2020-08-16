# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# User added

# Ensure local virtualenv setup
if [ ! -f "${HOME}/opt/venv/bin/virtualenv" ]; then
    curl -sL --location --output /tmp/virtualenv.pyz https://bootstrap.pypa.io/virtualenv.pyz
    python3 /tmp/virtualenv.pyz ~/opt/venv
    ~/opt/venv/bin/pip install --upgrade pip
    ~/opt/venv/bin/pip install virtualenv
    mkdir -p ~/bin  # Ensure exists if new machine
    ln -s ~/opt/venv/bin/virtualenv ~/bin/virtualenv
fi

# Add TeX Live to PATH
if [ -d "/usr/local/texlive/2018/bin/x86_64-linux" ] ; then
    PATH="/usr/local/texlive/2018/bin/x86_64-linux:$PATH"
fi
if [ -d "/usr/local/texlive/2018/texmf-dist/doc/man" ] ; then
    MANPATH="/usr/local/texlive/2018/texmf-dist/doc/man:$MANPATH"
fi
if [ -d "/usr/local/texlive/2018/texmf-dist/doc/info" ] ; then
    INFOPATH="/usr/local/texlive/2018/texmf-dist/doc/info:$INFOPATH"
fi

# Add Mendeley Desktop to PATH
if [ -d "/opt/mendeleydesktop-1.19.4-linux-x86_64/bin" ] ; then
    PATH="/opt/mendeleydesktop-1.19.4-linux-x86_64/bin:$PATH"
fi

# Add ROOT setup
# Built with: cmake -Dall="ON" -Dsoversion="ON" -Dqtgsi="OFF" -Dbuiltin_xrootd="ON" -Dcuda="OFF" -Dtmva-gpu="OFF" -DPYTHON_EXECUTABLE=$(which python3)
if [ -d "/usr/local/root/bin/" ] ; then
    . /usr/local/root/bin/thisroot.sh
fi

# Add GPG key
export GPG_TTY=$(tty)

# Add Go to PATH
if [ -d "${HOME}/go" ] ; then
    export GOPATH="${HOME}/go"
fi
if [ -d "/usr/local/go" ] ; then
    export PATH="/usr/local/go/bin:${PATH}:${GOPATH}/bin"
fi
