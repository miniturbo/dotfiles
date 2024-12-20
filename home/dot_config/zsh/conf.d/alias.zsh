alias ll='ls -l'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias vi='vim'
alias less='less -iMR'
alias tailf='tail -f'

# ls
case $(uname) in
  Darwin) alias ls='ls -FG' ;;
  *)      alias ls='ls -F --color=auto --group-directories-first' ;;
esac

# gls
type gls &> /dev/null && alias ls='gls -F --color=auto --group-directories-first'

# eza
type eza &> /dev/null && alias ls='eza --icons --group-directories-first'

# bat
type bat &> /dev/null && alias cat='bat'

# delta
type delta &> /dev/null && alias diff='delta'

# Neovim
type nvim &> /dev/null && alias vim='nvim'

# tmux + direnv
type tmux &> /dev/null && type direnv &> /dev/null && alias tmux='direnv exec / tmux'
