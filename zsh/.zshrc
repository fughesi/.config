#!/bin/sh

# uncomment function to check performance
# zmodload zsh/zprof

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(zoxide init zsh)"

source <(fzf --zsh)
source "$ZDOTDIR/zsh-functions"
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# no beeping
unsetopt BEEP

# case sensitivity = off
unsetopt CASE_GLOB

# history file
setopt appendhistory

# case insensitivity
compctl -M '' 'm:{a-z}={A-Z}' 

# Colors
autoload -Uz vcs_info
autoload -U colors && colors

# Plugins
zsh_add_plugin "lsd-rs/lsd"
zsh_add_plugin "zsh-users/zsh-autosuggestions"
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

# easier to read disk
alias df='df -h'
alias free='free -m'

# get top process eating memory
alias psmem='ps aux | sort -nr -k 4 | head -5'

# get top process eating cpu ##
alias pscpu='ps aux | sort -nr -k 3 | head -5'

# .git
alias init='git init -b main'
alias gst='git status'
alias gadd='git add .'
alias gpull='git pull'
alias gpush='git push'
alias gdiff='git diff'
alias gb='git branch -a'
alias gco='git checkout'
alias gmain="git checkout main"
alias gcob='git checkout -b'
alias glog='git log'
alias gac='git add . && git commit -m'

# general
alias f='zi'
alias l='lsd -alh --group-directories-first'
alias fzf='fzf -e --preview="bat --color=always {}" --preview-window "~3"'
alias mysql='/usr/local/mysql/bin/mysql'
alias address='ipconfig getifaddr en0'

# exports
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
export PATH=$PATH:"$HOME/.local/bin"
export PATH=$PATH:"$HOME/.cargo/bin"
export PATH=$PATH:"$HOME/.config"
export PATH=$PATH:"/opt/homebrew/bin/mongod"
export PATH=$PATH:"/opt/homebrew/opt/postgresql@15/bin"
export PATH=$PATH:"/usr/local/mysql/bin/mysql"

# XDG paths
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export CDPATH=.:$HOME:$HOME/.config:$HOME/.config/zsh:$HOME/.config/vim:$HOME/Desktop:$HOME/Projects/websites


### ----------- PROMPT BEGIN ------------ ###

# enable only git 
 zstyle ':vcs_info:*' enable git 

# setup a hook that runs before every prompt. 
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

# add a function to check for untracked files in the directory.
# from https://github.com/zsh-users/zsh/blob/master/Misc/vcs_info-examples
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
 
+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        # This will show the marker if there are any untracked files in repo.
        # If instead you want to show the marker only if there are untracked
        # files in $PWD, use:
        #[[ -n $(git ls-files --others --exclude-standard) ]] ; then
        hook_com[staged]+='!' # signify new files with a bang
    fi
}

# ANSI color codes
# https://en.wikipedia.org/wiki/ANSI_escape_code#3-bit_and_4-bit
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats " %{$fg[blue]%}(%{$fg[red]%}%m%u%c%{$fg[yellow]%}%{$fg[magenta]%} %b%{$fg[blue]%})"


PROMPT=$'%B┌─[%b%{\e[0m%}%{\e[1;32m%}%n%{\e[1;34m%} @ %{\e[0m%}%{\e[0;36m%}%m%{\e[0;34m%}%B]%b%{\e[0m%} - %b%{\e[0;34m%}%B[%b%{\e[1;37m%}%~%{\e[0;34m%}%B]%b%{\e[0m%} - %{\e[0;34m%}%B[%b%{\e[0;33m%}%!%{\e[0;34m%}%B]%b
%B└─%B[%{\e[1;35m%}$%{\e[0;34m%}%B]%{\e[0m%}%b'
PROMPT+="\$vcs_info_msg_0_ "

### ----------- PROMPT END ------------ ###


neofetch

# uncomment function to check performance
  # zprof
