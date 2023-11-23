# zmodload zsh/zprof

unsetopt GLOBAL_RCS

typeset -U path

path=(
  $HOME/.local/bin(N-/)
  /opt/homebrew/bin(N-/)
  /usr/local/bin(N-/)
  /usr/bin(N-/)
  /bin(N-/)
  $HOME/.local/sbin(N-/)
  /opt/homebrew/sbin(N-/)
  /usr/local/sbin(N-/)
  /usr/sbin(N-/)
  /sbin(N-/)
)

export EDITOR="vim"

export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

export ZDOTDIR=$XDG_CONFIG_HOME/zsh