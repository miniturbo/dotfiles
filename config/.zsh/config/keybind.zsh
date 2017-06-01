bindkey -e

bindkey "^[[H"  beginning-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[[F"  end-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[3~" delete-char-or-list

bindkey "^G" anyframe-widget-cd-ghq-repository
bindkey "^K" anyframe-widget-kill
bindkey "^R" anyframe-widget-put-history
