function! marble#lightline#init()
  let g:lightline = {
  \   'colorscheme': 'hybrid',
  \   'active': {
  \     'left': [['mode', 'paste'], ['fugitive', 'filename']]
  \   },
  \   'component_function': {
  \     'fugitive': 'marble#lightline#fugitive',
  \     'filename': 'marble#lightline#filename',
  \   },
  \   'separator': { 'left': '', 'right': '' },
  \   'subseparator': { 'left': '', 'right': '' }
  \ }
endfunction

function! marble#lightline#fugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ' ' . _ : ''
  endif
  return ''
endfunction

function! marble#lightline#filename()
  return ('' != marble#lightline#readonly() ? marble#lightline#readonly() . ' ' : '') .
         \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
         \  &ft == 'unite' ? unite#get_status_string() :
         \  &ft == 'vimshell' ? vimshell#get_status_string() :
         \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
         \ ('' != marble#lightline#modified() ? ' ' . marble#lightline#modified() : '')
endfunction

function! marble#lightline#readonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '' : ''
endfunction

function! marble#lightline#modified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction
