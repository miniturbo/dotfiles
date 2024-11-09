# direnv
type direnv &> /dev/null && eval "$(direnv hook zsh)"

# fzf
if type fzf &> /dev/null; then
  if type brew &> /dev/null; then
    source "$(brew --prefix)/opt/fzf/shell/completion.zsh"
    source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"
  fi

  export FZF_DEFAULT_OPTS='--layout=reverse --exit-0'
  export RUNEWIDTH_EASTASIAN=0
fi

# Google Cloud SDK
if test -d "$(brew --prefix)/share/google-cloud-sdk"; then
  source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
  source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
fi

# Homebrew
type brew &> /dev/null && eval "$($(which brew) shellenv | grep -v 'export PATH=')"

# mise-en-place
type mise &> /dev/null && eval "$(mise activate zsh)"

# Starship
type starship &> /dev/null && eval "$(starship init zsh)"
