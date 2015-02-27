#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

source ~/.zshenv

boot2docker up | grep export | while read cmd; do eval "${cmd}"; done

export EDITOR="vim"
export VISUAL="vim"

function dockercleanimages() {
    docker images | awk '$1 == "<none>" { print $3 }' | xargs docker rmi
}

function dockercleanps() {
    docker ps -a | awk '$1 != "CONTAINER" {print $1}' | xargs docker rm
}
