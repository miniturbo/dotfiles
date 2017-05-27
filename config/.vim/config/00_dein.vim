if &compatible
  set nocompatible
endif
set runtimepath^=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))
call dein#add('Shougo/dein.vim')
call dein#add('haya14busa/dein-command.vim')

" framework
call dein#add('edkolev/tmuxline.vim')
call dein#add('itchyny/lightline.vim')
call dein#add('tpope/vim-fugitive')

" color scheme
call dein#add('w0ng/vim-hybrid')
call dein#add('cocopon/lightline-hybrid.vim')

" syntax
call dein#add('cespare/vim-toml')
call dein#add('fatih/vim-go')
call dein#add('kchmck/vim-coffee-script')
call dein#add('leafgarland/typescript-vim')
call dein#add('motemen/xslate-vim')
call dein#add('othree/es.next.syntax.vim')
call dein#add('othree/yajs.vim')
call dein#add('tmux-plugins/vim-tmux')
call dein#add('vim-perl/vim-perl')

call dein#end()

filetype plugin indent on

if dein#check_install()
  call dein#install()
endif
