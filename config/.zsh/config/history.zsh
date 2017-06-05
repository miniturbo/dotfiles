HISTFILE=$HOME/.zsh/history
HISTSIZE=10000
SAVEHIST=10000

setopt extended_history         # 時刻も合わせて記録する
setopt hist_ignore_all_dups     # 入力された行が古い行と同じ場合は古い行を削除する
setopt hist_ignore_dups         # 直前の行と全く同じ場合は履歴に追加しない
setopt hist_ignore_space        # スペースから始まる場合は履歴に追加しない
setopt hist_no_functions        # 関数定義は履歴に追加しない
setopt hist_no_store            # historyコマンド自体は履歴に追加しない
setopt hist_reduce_blanks       # 履歴に追加する際に余計な空白文字を取り除く
setopt inc_append_history_time  # 履歴をコマンド実行後に追加する
