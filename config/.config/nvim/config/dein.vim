let s:cache_dir = expand('~/.cache')
let s:base_dir = expand(s:cache_dir .. '/dein')
let s:toml_dir = expand('~/.config/nvim/config/toml')

if !isdirectory(s:cache_dir)
  call mkdir(s:cache_dir, 'p')
endif

if &runtimepath !~# '/dein.vim'
  let s:dein_dir = fnamemodify('dein.vim', ':p')

  if !isdirectory(s:dein_dir)
    let s:dein_dir = expand(s:cache_dir .. '/dein/repos/github.com/Shougo/dein.vim')

    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' .. substitute(fnamemodify(s:dein_dir, ':p'), '[/\\]$', '', '')
endif

if dein#load_state(s:base_dir)
  call dein#begin(s:base_dir)
  call dein#load_toml(s:toml_dir . '/dein.toml', { 'lazy': 0 })
  call dein#load_toml(s:toml_dir . '/dein_lazy.toml', { 'lazy': 1 })
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on

if has('syntax')
  syntax on
endif

if dein#check_install()
  call dein#install()
endif
