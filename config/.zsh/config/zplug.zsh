export ZPLUG_HOME=$HOME/.zsh/zplug
source $ZPLUG_HOME/init.zsh

# functions
zplug "mafredri/zsh-async"
zplug "mollifier/anyframe"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# prompt
zplug "sindresorhus/pure", use:pure.zsh, as:theme

# zplug
zplug "zplug/zplug", hook-build:"zplug --self-manage"

zplug load
