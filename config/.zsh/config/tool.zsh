# dotfiles
if [[ -d $HOME/.dotfiles ]]; then
  path=($HOME/.dotfiles/bin(N-/) $path)
fi

# anyenv
if [[ -d $HOME/.anyenv ]]; then
  path=($HOME/.anyenv/bin(N-/) $path)
  eval "$(anyenv init -)"
fi

# direnv
if type direnv > /dev/null; then
  eval "$(direnv hook zsh)"
fi
