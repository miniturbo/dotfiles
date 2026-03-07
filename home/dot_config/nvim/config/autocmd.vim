augroup marble
  autocmd!

  " 前回のカーソル位置に移動する
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   execute "normal g`\"" |
    \ endif

  " 自動コメントを無効にする
  autocmd FileType * setlocal formatoptions-=ro

  " 挿入モードから離れる際にペースモードを解除する
  autocmd InsertLeave * set nopaste
augroup END
