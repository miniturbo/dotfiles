export ZSH_ROOT=$HOME/.zsh

function zcompare() {
  if [[ -s ${1} && ( ! -s ${1}.zwc || ${1} -nt ${1}.zwc) ]]; then
    zcompile ${1}
  fi
}

function loadlib() {
  lib=${1:?"You have to specify a library file"}
  if [[ -f $lib ]]; then
    zcompare $lib
    . $lib
  fi
}
