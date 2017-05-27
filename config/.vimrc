" ----------------------------------------------------------
"   General
" ----------------------------------------------------------
runtime! config/*.vim " conf.d/*.vim を読み込む

set clipboard=unnamed " ヤンクした文字列をクリップボードにコピーする
set cursorline        " 行番号をハイライト表示する
set laststatus=2      " 常にステータスラインを表示する
set number            " 行番号を表示する

" 前回終了したカーソル行に移動
autocmd MyAutoCmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" ----------------------------------------------------------
"   File
" ----------------------------------------------------------
set autoread                                     " 外部で変更があった際に自動的に読み直す
set encoding=utf-8                               " 内部文字コード
set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp " 読み込み時の文字コード
set fileformats=unix,mac,dos                     " 読み込み時の改行コード
set nobackup                                     " バックアップファイルを作成しない
set noswapfile                                   " スワップファイルを作成しない
set viminfo+=n~/.vim/info                        " viminfoファイルを出力する

" ----------------------------------------------------------
"   Display
" ----------------------------------------------------------
set lazyredraw                                           " マクロなどの途中経過を表示しない
set list                                                 " 不可視文字を表示する
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:% " 不可視文字の指定
set ttyfast                                              " 高速ターミナル接続を使う

" ----------------------------------------------------------
"   Indent
" ----------------------------------------------------------
set autoindent    " 自動インデントを行う
set expandtab     " タブ文字を空白文字に置き換える
set shiftwidth=2  " 自動インデントの際の空白文字数
set smartindent   " C言語風の自動インデントを行う
set softtabstop=2 " タブ文字を入力した際の空白文字数
set tabstop=2     " タブ文字の文字幅

" 改行時にコメントを継続しない
autocmd MyAutoCmd FileType * setlocal formatoptions-=ro

autocmd MyAutoCmd FileType perl   setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd MyAutoCmd FileType python setlocal shiftwidth=2 tabstop=2 softtabstop=2

" ----------------------------------------------------------
"   Paste
" ----------------------------------------------------------
inoremap <F11> <nop>              " 標準のF11キーを無効にする
set pastetoggle=<F11>             " F11でペーストモードを切り替える
autocmd InsertLeave * set nopaste " インサートモードを抜ける

" ----------------------------------------------------------
"   Color Scheme
" ----------------------------------------------------------
set background=dark

let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast   = 1

colorscheme hybrid
