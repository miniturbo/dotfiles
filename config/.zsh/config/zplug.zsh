export ZPLUG_HOME=$HOME/.zsh/zplug
export ZPLUG_LOADFILE=$HOME/.zsh/plugins.zsh

[[ -f $ZPLUG_LOADFILE ]] || touch $ZPLUG_LOADFILE

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
