augroup marble
  autocmd!

  " 前回のカーソル位置に移動する
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   execute "normal g`\"" |
    \ endif

  " 自動コメントを無効にする
  "autocmd FileType * setlocal formatoptions-=ro

  " インサートモードを抜ける
  "autocmd InsertLeave * set nopaste
augroup END
