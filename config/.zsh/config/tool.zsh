# dotfiles
if [[ -d $HOME/.dotfiles ]]; then
  path=($HOME/.dotfiles/bin(N-/) $path)
fi

# direnv
if type direnv > /dev/null; then
  eval "$(direnv hook zsh)"
fi
