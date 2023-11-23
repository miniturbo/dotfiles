# direnv
type direnv > /dev/null && eval "$(direnv hook zsh)"

# dotfiles
[[ -d $HOME/.dotfiles ]] && path=($HOME/.dotfiles/bin(N-/) $path)

# fzf
if type fzf > /dev/null; then
  source "$(brew --prefix)/opt/fzf/shell/completion.zsh"
  source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"

  export FZF_DEFAULT_OPTS='--layout=reverse --exit-0'
  export RUNEWIDTH_EASTASIAN=0
fi

# Homebrew
[[ -f /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv | grep -v 'export PATH=')"

# rtx
type rtx > /dev/null && eval "$(rtx activate zsh)"

# Starship
type starship > /dev/null && eval "$(starship init zsh)"