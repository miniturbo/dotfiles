mkdir -p $XDG_DATA_HOME/zsh

HISTFILE=$XDG_DATA_HOME/zsh/history
HISTSIZE=1000000
SAVEHIST=1000000

setopt extended_history
setopt hist_allow_clobber
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_no_functions
setopt hist_no_store
setopt hist_reduce_blanks
setopt hist_verify
setopt inc_append_history_time
