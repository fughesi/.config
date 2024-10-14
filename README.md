be sure to add a .zprofile dir to home with the following contents:


#! /bin/zsh
 
ZDOTDIR=$HOME/.config/zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
