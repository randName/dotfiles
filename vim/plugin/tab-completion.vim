function! SmartTab()
  let l:c = col('.') - 2
  if l:c > -1 && (getline('.')[l:c] =~ '\k')
    return "\<C-p>"
  endif
  return "\<tab>"
endfunction

inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : SmartTab()
inoremap <expr> <Space> pumvisible() ? "\<C-y>" : "\<Space>"
