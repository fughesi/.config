#! /bin/zsh


export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

ZDOTDIR=$HOME/.config/zsh


# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/fughesi/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
