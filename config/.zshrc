. $HOME/.zsh/init.zsh

loadlib $ZSH_ROOT/config/zplug.zsh
loadlib $ZSH_ROOT/config/alias.zsh
loadlib $ZSH_ROOT/config/completion.zsh
loadlib $ZSH_ROOT/config/history.zsh
loadlib $ZSH_ROOT/config/keybind.zsh
loadlib $ZSH_ROOT/config/anyenv.zsh
loadlib $ZSH_ROOT/config/tool.zsh

[[ "$ZPROF" = 1 ]] && zprof | less
