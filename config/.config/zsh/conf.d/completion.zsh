mkdir -p $XDG_STATE_HOME/zsh

autoload -Uz compinit && compinit -d $XDG_STATE_HOME/zsh/zcompdump

setopt list_packed
setopt menu_complete

zstyle ':completion:*' file-list all
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-separator '→'
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose yes

zstyle ':completion:*:default'      format '%F{cyan}%B%d%b%f'
zstyle ':completion:*:warnings'     format '%F{red}No matches for: %B%d%b%f'
zstyle ':completion:*:descriptions' format '%F{yellow}%BCompleting %d%b%f'