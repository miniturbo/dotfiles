if status is-interactive
  # dotfiles
  test -d $HOME/.dotfiles; and _set_path $HOME/.dotfiles/bin

  # anyenv
  type -q anyenv; and builtin source (anyenv init - | psub)

  # direnv
  type -q direnv; and eval (direnv hook fish)

  # tmux
  type -q tmux; and test -n "$TMUX"; and _tmux_auto_rename_session
end
