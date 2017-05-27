# ----------------------------------------------------------
#   zplug (Zsh Plugin Manager)
# ----------------------------------------------------------
source $ZPLUG_HOME/init.zsh

# functions
zplug "mafredri/zsh-async"
zplug "mollifier/anyframe"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# prompt
zplug "sindresorhus/pure", defer:1

# zplug
zplug "zplug/zplug", hook-build:"zplug --self-manage"

if ! zplug check; then
  zplug install
fi

zplug load

# ----------------------------------------------------------
#   Settings
# ----------------------------------------------------------

# general
CORRECT_IGNORE="_*"
CORRECT_IGNORE_FILE=".*"

setopt correctall  # コマンドやファル名のスペルミス修正を試みる
setopt hist_expand # 補完時に履歴を自動的に展開する

# history
HISTFILE=~/.zsh/history
HISTSIZE=10000
SAVEHIST=10000

setopt extended_history     # 時刻も合わせて記録する
setopt hist_ignore_all_dups # 入力された行が古い行と全く同じ場合は古い行を削除する
setopt hist_ignore_dups     # 直前の行と全く同じ場合は履歴に追加しない
setopt hist_ignore_space    # スペースから始まる場合は履歴に追加しない
setopt hist_no_functions    # 関数定義は履歴に追加しない
setopt hist_no_store        # histaoryコマンド自体は履歴に追加しない
setopt hist_reduce_blanks   # 履歴に追加する際に余計な空白文字を取り除く
setopt inc_append_history   # 履歴をインクリメンタルに追加する

# completion
setopt list_packed   # 補完候補を詰めて表示する
#setopt auto_param_slash
#setopt always_last_prompt
setopt menu_complete # 曖昧な補完時に最初の候補を挿入する

zstyle ":completion:*" menu select          # 補完候補を矢印キーで選べるようにする
zstyle ":completion:*" verbose yes          # 詳細情報を表示する
zstyle ":completion:*" group-name ''        # 補完候補を種別表示する
zstyle ':completion:*' list-separator '-->' # 区切り文字

zstyle ":completion:*"              format "%F{cyan}%B%d%b%f"
zstyle ":completion:*:warnings"     format "%F{red}No matches for: %B%d%b%f"
zstyle ":completion:*:descriptions" format '%F{yellow}%d%f'

ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=("expand-or-complete") # 補完実行時にzsh-autosuggestionsの動作を止める

# ----------------------------------------------------------
#   Key Bindings
# ----------------------------------------------------------
bindkey -e

bindkey "^[[H"  beginning-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[[F"  end-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[3~" delete-char-or-list

bindkey "^G" anyframe-widget-cd-ghq-repository
bindkey "^K" anyframe-widget-kill
bindkey "^R" anyframe-widget-put-history

# ----------------------------------------------------------
#   Alias
# ----------------------------------------------------------
alias cp="nocorrect cp -i"
alias git="nocorrect git"
alias heroku="nocorrect heroku"
alias l.="ls -d .*"
alias less="less -R"
alias ll="ls -lh"
alias mv="nocorrect mv -i"
alias rm="rm -i"
alias tailf="tail -f"
alias vi="nocorrect vim"

# color ls
case $(uname) in
  Darwin) alias ls="ls -FG" ;;
  *)      alias ls="ls --color=auto -F" ;;
esac

# colordiff
if type colordiff > /dev/null 2>&1; then
  alias diff='colordiff'
fi

# Homebrew
alias brew="env PATH=${PATH/${HOME}\/\.anyenv\/envs\/*env\/shims:/} brew"

# Ruby
alias be="nocorrect bundle exec --"
alias serve="ruby -run -e httpd -- --bind-address=0.0.0.0 --port=3000 ."

# Perl
alias ce="nocorrect carton exec --"
