[[ ! -f $HOME/.anyenv/bin/anyenv ]] && return

path=($HOME/.anyenv/bin(N-/) $path)

export ANYENV_ROOT=$HOME/.anyenv

if ! diff $HOME/.cache/anyenv/envs <($ANYENV_ROOT/libexec/anyenv-envs) > /dev/null 2>&1; then
  mkdir -p $HOME/.cache/anyenv
  anyenv envs   > $HOME/.cache/anyenv/envs
  anyenv init - > $HOME/.cache/anyenv/init
fi

source $HOME/.cache/anyenv/init

type bundle > /dev/null && alias be="bundle exec --"
