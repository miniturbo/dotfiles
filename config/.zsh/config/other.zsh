export EDITOR="nvim"

CORRECT_IGNORE="_*"
CORRECT_IGNORE_FILE=".*"

setopt correctall  # コマンドやファル名のスペルミス修正を試みる

ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=("expand-or-complete") # 補完実行時にzsh-autosuggestionsの動作を止める
