if status is-interactive
  # dotfiles
  test -d $HOME/.dotfiles && _set_path $HOME/.dotfiles/bin

  # linuxbrew
  test -f /home/linuxbrew/.linuxbrew/bin/brew && eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)

  # anyenv
  type -q anyenv && builtin source (anyenv init - | psub)

  # direnv
  type -q direnv && eval (direnv hook fish)

  # tmux
  type -q tmux && test -n "$TMUX" && _tmux_auto_rename_session
end
