# ----------------------------------------------------------
#   Environment Variables
# ----------------------------------------------------------
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

export EDITOR="vi"

# Homebrew-Cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# zplug
export ZPLUG_HOME="$HOME/.zsh/zplug"

# dot
export DOT_REPO="git@github.com:miniturbo/dotfiles.git"
export DOT_DIR="$HOME/.dotfiles"

# direnv
if type direnv > /dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

# anyenv
if [ -d $HOME/.anyenv ]; then
  path=($HOME/.anyenv/bin(N-/) $path)
  eval "$(anyenv init -)"
fi

# goenv
if type goenv > /dev/null 2>&1; then
  export GOPATH="$HOME/.go"
  path=($GOPATH/bin(N-/) $path)
fi
