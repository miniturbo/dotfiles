let s:conf_dir = expand('~/.config/nvim')
let s:dein_dir = expand('~/.local/share/dein')

execute 'set runtimepath+=' . s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:conf_dir . '/dein.toml', { 'lazy': 0 })
  call dein#load_toml(s:conf_dir . '/dein_lazy.toml', { 'lazy': 1 })
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif
