# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/fughesi/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/Users/fughesi/.fzf/bin"
fi

eval "$(fzf --bash)"
