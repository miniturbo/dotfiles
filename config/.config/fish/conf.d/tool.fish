# dotfiles
if test -d $HOME/.dotfiles
  _set_path $HOME/.dotfiles/bin
end

# anyenv
if test -d $HOME/.anyenv
  _set_path $HOME/.anyenv/bin
  status --is-interactive; and source (anyenv init - | psub)
end

# direnv
if type -q direnv
  eval (direnv hook fish)
end
