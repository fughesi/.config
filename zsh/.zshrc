#!/bin/zsh

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(zoxide init zsh)"

source <(fzf --zsh)
source "$ZDOTDIR/zsh-functions"

# get all scripts from bin folder && source
for scripts in $HOME/.config/bin/*.sh; do [[ -f "$scripts" ]] && source "$scripts"; done

# options
unsetopt BEEP # no beeping
unsetopt CASE_GLOB # case insensitivity
setopt appendhistory # history file

#vi mode
bindkey -v
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line # use cntrl + e to open cmd in vim

# Colors
autoload -Uz vcs_info
autoload -U colors && colors

# Plugins
zsh_add_plugin "lsd-rs/lsd"
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "marlonrichert/zsh-autocomplete"
zsh_add_plugin "hlissner/zsh-autopair"
zsh_add_plugin "ajeetdsouza/zoxide"

# Colorize grep output 
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# .git
alias init='git init -b main'
alias gst='git status -bvu --show-stash'
alias gb='git branch -a'
alias gco='git checkout'
alias gcob='git checkout -b'
alias glog='git log --oneline --graph --decorate --all'
alias gmain="git checkout main"
alias gac='git add . && git commit -m'

# file extensions to open in vim
alias -s {md,html,css,js,json,rs,txt,yml,sh}=vim

# general
alias f='zi'
alias l='lsd -Alh --group-directories-first'
alias fzf='fzf -e --preview="bat --color=always {}" --preview-window "~3"'
alias empty="find . -type d -empty -print -delete"
alias python="python3"
alias zsource="source ~/.config/zsh/.zshrc"
alias address='ipconfig getifaddr en0'
alias path="echo $path | tr ' ' '\n'"
alias ports="lsof -i -P"
alias rsync="rsync -rPavh"
alias ..="cd .."

# XDG paths
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# XDG-ninja recommendations
export NPM_CONFIG_INIT_MODULE="$XDG_CONFIG_HOME"/npm/config/npm-init.js
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME"/npm
export NPM_CONFIG_TMP="$XDG_RUNTIME_DIR"/npm
export MYSQL_HISTFILE="$XDG_DATA_HOME"/mysql_history
export NODE_REPL_HISTORY="$XDG_STATE_HOME"/node_repl_history
export LESSHISTFILE="${XDG_STATE_HOME}"/lesshst
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"


# history
HISTSIZE=10000
SAVEHIST=10000
HISTCONTROL=ignoreboth
HISTFILE="$XDG_STATE_HOME"/zsh/history

# path
path=(
    $path
    $HOME/.local/bin
    $HOME/.cargo/bin
    $HOME/.config
    $HOME/.config/vim
    /usr/local/mysql/bin/mysql
    /opt/homebrew/bin/mongod
    /opt/homebrew/opt/postgresql@15/bin
    /opt/homebrew/opt/llvm/bin
    /opt/homebrew/bin/python3
)
typeset -U path #remove dupes
export path

export CDPATH="$HOME/.config:$HOME/.vim:$HOME/Projects/websites:$HOME/School/current/database:$HOME/School/current/legal:$HOME/School/current/management:$HOME/School/current/multimedia"

# defaults
export EDITOR=vim
export TERMINAL=tabby
export BROWSER=brave

neofetch


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
