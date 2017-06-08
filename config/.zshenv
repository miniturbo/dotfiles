[[ "$ZPROF" = 1 ]] && zmodload zsh/zprof && zprof

typeset -U path

path=(
  $HOME/.local/bin(N-/)
  /usr/local/bin(N-/)
  /usr/bin(N-/)
  /bin(N-/)
  /usr/local/sbin(N-/)
  /usr/sbin(N-/)
  /sbin(N-/)
)

export EDITOR="nvim"
