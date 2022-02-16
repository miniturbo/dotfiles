if status is-interactive
  # dotfiles
  test -d $HOME/.dotfiles && _set_path $HOME/.dotfiles/bin

  # asdf
  type -q asdf && builtin source (brew --prefix asdf)'/asdf.fish'

  # anyenv
  type -q anyenv && builtin source (anyenv init - | psub)

  # direnv
  type -q direnv && eval (direnv hook fish)

  # tmux
  type -q tmux && test -n "$TMUX" && _tmux_auto_rename_session

  # mysql@5.7
  test -d /usr/local/opt/mysql@5.7 && _set_path /usr/local/opt/mysql@5.7/bin

  # imagemagick@6
  test -d /usr/local/opt/imagemagick@6 && _set_path /usr/local/opt/imagemagick@6/bin

  # diff-highlight
  test -d /usr/local/share/git-core/contrib/diff-highlight && _set_path /usr/local/share/git-core/contrib/diff-highlight

  # google-cloud-sdk
  if test -d /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk
    _set_path /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin
    set -x CLOUDSDK_PYTHON /usr/local/opt/python@3.9/libexec/bin/python
  end
end
