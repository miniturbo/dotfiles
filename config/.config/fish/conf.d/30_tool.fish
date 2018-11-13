if status is-interactive
  # dotfiles
  if test -d $HOME/.dotfiles
    _set_path $HOME/.dotfiles/bin
  end

  # anyenv
  if test -d $HOME/.anyenv; and not type -q anyenv
    _set_path $HOME/.anyenv/bin
    builtin source (anyenv init - | psub)

    # fix **env/bin path position and deduplicate path
    set -l new_path
    for p in $PATH
      contains $p $new_path; and continue
      set new_path $new_path $p
      string match -q '**/.anyenv/envs/*env/shims' $p; and \
        set new_path $new_path (string replace -ra '/shims$' '/bin' $p)
    end
    set PATH $new_path
  end

  # direnv
  if type -q direnv
    eval (direnv hook fish)
  end
end
