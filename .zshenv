#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

typeset -U path
path=($path /usr/local/git/bin ${HOME}/bin ${HOME}/projects/docker-compose/bin /Library/Frameworks/Python.framework/Versions/3.4/bin)

export GOPATH=${HOME}/projects/go
export PATH=${PATH}:${GOPATH}/bin
#typeset -U path
#path=($path $gopath/bin)

export EDITOR="vim"
export VISUAL="vim"

alias uuidgen="uuidgen | tr '[A-Z]' '[a-z]'"

export PKG_CONFIG_PATH=/usr/local/opt/libffi/lib/pkgconfig
