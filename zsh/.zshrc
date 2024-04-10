#!/bin/sh

# uncomment function to check performance
  # zmodload zsh/zprof


# case insensitivity
compctl -M '' 'm:{a-z}={A-Z}' 


# Colors
 autoload -Uz colors && colors

# Useful Functions
source "$ZDOTDIR/zsh-functions"

# Normal files to source
zsh_add_file "zsh-options" 
zsh_add_file "zsh-exports"
zsh_add_file "zsh-vim-mode"
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-prompt"

# Plugins
zsh_add_plugin "lsd-rs/lsd"
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"
zsh_add_plugin "ajeetdsouza/zoxide"


eval "$(zoxide init zsh)"

# start neofetch sysinfo
neofetch


# uncomment function to check performance
  # zprof
