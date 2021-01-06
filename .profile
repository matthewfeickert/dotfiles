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

# Add TeX Live to PATH
if [ -d "/usr/local/texlive/2020/bin/x86_64-linux" ] ; then
    PATH="/usr/local/texlive/2020/bin/x86_64-linux:$PATH"
fi
if [ -d "/usr/local/texlive/2020/texmf-dist/doc/man" ] ; then
    MANPATH="/usr/local/texlive/2020/texmf-dist/doc/man:$MANPATH"
fi
if [ -d "/usr/local/texlive/2020/texmf-dist/doc/info" ] ; then
    INFOPATH="/usr/local/texlive/2020/texmf-dist/doc/info:$INFOPATH"
fi

# Add ROOT to PATH
# c.f. ~/build_src for build history
if [ -d "${HOME}/bin/root/bin" ] ; then
    . "${HOME}/bin/root/bin/thisroot.sh"
fi

# Add CUDA Toolkit 10.1 to PATH
# /usr/local/cuda-10.1 should be a symlink to /usr/lib/cuda
if [ -d "/usr/local/cuda-10.1/bin" ]; then
    PATH="/usr/local/cuda-10.1/bin:${PATH}"; export PATH;
elif [ -d "/usr/lib/cuda/bin" ]; then
    PATH="/usr/lib/cuda/bin:${PATH}"; export PATH;
fi
# Add cuDNN to LD_LIBRARY_PATH
# /usr/local/cuda should be a symlink to /usr/lib/cuda
if [ -d "/usr/local/cuda/lib64" ]; then
    LD_LIBRARY_PATH="/usr/local/cuda/lib64:${LD_LIBRARY_PATH}"; export LD_LIBRARY_PATH;
elif [ -d "/usr/lib/cuda/lib64" ]; then
    LD_LIBRARY_PATH="/usr/lib/cuda/lib64:${LD_LIBRARY_PATH}"; export LD_LIBRARY_PATH;
fi

# Added by cpan
if [ -d "/home/${USER}/perl5" ]; then
    PATH="/home/${USER}/perl5/bin${PATH:+:${PATH}}"; export PATH;
    PERL5LIB="/home/${USER}/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
    PERL_LOCAL_LIB_ROOT="/home/${USER}/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
    PERL_MB_OPT="--install_base \"/home/${USER}/perl5\""; export PERL_MB_OPT;
    PERL_MM_OPT="INSTALL_BASE=/home/${USER}/perl5"; export PERL_MM_OPT;
fi

# Add Bazel support
if [ -d "/home/${USER}/bin" ]; then
    PATH="/home/${USER}/bin${PATH:+:${PATH}}"; export PATH;
fi
if [ -d "/home/${USER}/.bazel/bin" ]; then
    . "/home/${USER}/.bazel/bin/bazel-complete.bash"
fi

# Add Rust
if [ -d "${HOME}/.cargo/bin" ]; then
    PATH="${HOME}/.cargo/bin${PATH:+:${PATH}}"; export PATH;
fi

# Add rbenv
if [ -d "${HOME}/.rbenv/bin" ]; then
    PATH="${HOME}/.rbenv/bin${PATH:+:${PATH}}"; export PATH;
    eval "$(rbenv init -)"
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

# Add Mendeley Desktop to PATH
if [ -d "/opt/mendeleydesktop-1.19.4-linux-x86_64/bin" ] ; then
    PATH="/opt/mendeleydesktop-1.19.4-linux-x86_64/bin:$PATH"
fi
