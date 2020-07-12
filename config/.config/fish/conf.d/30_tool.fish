if status is-interactive
  # dotfiles
  test -d $HOME/.dotfiles && _set_path $HOME/.dotfiles/bin

  # anyenv
  type -q anyenv && builtin source (anyenv init - | psub)

  # direnv
  type -q direnv && eval (direnv hook fish)

  # tmux
  type -q tmux && test -n "$TMUX" && _tmux_auto_rename_session

  # mysql@5.7
  test -d /usr/local/opt/mysql@5.7 && _set_path /usr/local/opt/mysql@5.7/bin
end
