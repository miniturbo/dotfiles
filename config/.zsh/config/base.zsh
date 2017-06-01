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
