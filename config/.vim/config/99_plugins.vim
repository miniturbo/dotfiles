" ----------------------------------------------------------
"   lightline.vim
" ----------------------------------------------------------
let g:lightline = {
\   'colorscheme': 'hybrid',
\   'active': {
\     'left': [['mode', 'paste'], ['fugitive', 'filename']]
\   },
\   'component_function': {
\     'fugitive': 'LightLineFugitive',
\     'filename': 'LightLineFilename',
\   },
\   'separator': { 'left': '', 'right': '' },
\   'subseparator': { 'left': '', 'right': '' }
\ }

function! LightLineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ' ' . _ : ''
  endif
  return ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
         \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
         \  &ft == 'unite' ? unite#get_status_string() :
         \  &ft == 'vimshell' ? vimshell#get_status_string() :
         \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
         \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '' : ''
endfunction

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

" ----------------------------------------------------------
"   tmuxline.vim
" ----------------------------------------------------------
let g:tmuxline_theme  = 'lightline'
let g:tmuxline_preset = 'marble'

" ----------------------------------------------------------
"   vim-go
" ----------------------------------------------------------
let g:go_highlight_functions         = 1
let g:go_highlight_methods           = 1
let g:go_highlight_fields            = 1
let g:go_highlight_types             = 1
let g:go_highlight_operators         = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command                 = 'goimports'
