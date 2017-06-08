#setopt always_last_prompt
#setopt auto_param_slash
setopt hist_expand          # 補完時に履歴を自動的に展開する
setopt list_packed          # 補完候補を詰めて表示する
setopt menu_complete        # 曖昧な補完時に最初の候補を挿入する
setopt no_correct_all

zstyle ":completion:*" menu select          # 補完候補を矢印キーで選べるようにする
zstyle ":completion:*" verbose yes          # 詳細情報を表示する
zstyle ":completion:*" group-name ''        # 補完候補を種別表示する
zstyle ':completion:*' list-separator '-->' # 区切り文字

zstyle ":completion:*"              format "%F{cyan}%B%d%b%f"
zstyle ":completion:*:warnings"     format "%F{red}No matches for: %B%d%b%f"
zstyle ":completion:*:descriptions" format '%F{yellow}%d%f'

#ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=("expand-or-complete") # 補完実行時にzsh-autosuggestionsの動作を止める
