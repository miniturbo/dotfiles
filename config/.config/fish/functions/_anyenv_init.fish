function _anyenv_init
  _set_path $HOME/.anyenv/bin
  builtin source (anyenv init - | string replace -r 'set -x ([A-Z]+ENV_ROOT)' 'set -gx $1' | psub)

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
