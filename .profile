export PATH="${HOME}/bin:/usr/local/opt/ccache/libexec:$PATH"

if test -f "${HOME}/.local_profile"
then
    source "${HOME}/.local_profile"
fi

alias l=ls
alias ll="ls -l"
alias lla="ls -la"
alias c=clear
alias m=make
