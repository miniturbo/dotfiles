function fzf-ghq() {
  local selected=$(ghq list | fzf --preview 'ghq list --full-path --exact {} | xargs eza -hlrT -L 2 -s modified --time-style=iso --no-permissions --no-filesize --no-user --git --git-ignore')

  if [[ -n "$selected" ]]; then
    BUFFER="cd $(ghq list --full-path --exact $selected)"
    zle accept-line
  fi

  zle clear-screen
}

zle -N fzf-ghq
