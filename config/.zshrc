source $HOME/.zsh/config/zplug.zsh
source $HOME/.zsh/config/history.zsh
source $HOME/.zsh/config/completion.zsh
source $HOME/.zsh/config/keybind.zsh
source $HOME/.zsh/config/alias.zsh
source $HOME/.zsh/config/anyenv.zsh
source $HOME/.zsh/config/tool.zsh
source $HOME/.zsh/config/other.zsh

[[ "$ZPROF" = 1 ]] && zprof | less
