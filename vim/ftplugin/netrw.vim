function! s:FindNetrw()
  redir => scriptnames
  silent! scriptnames
  redir END
  for script in split(l:scriptnames, '\n')
    if l:script =~ 'netrw.vim'
      return str2nr(split(l:script, ':')[0])
    endif
  endfor
endfunction

let b:netrw_call = ':call <SNR>' . s:FindNetrw() . '_'

let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_dirhistmax=0

let g:netrw_alto=1
let g:netrw_altv=1
let g:netrw_winsize=80
let g:netrw_browse_split=2

let g:netrw_list_hide=netrw_gitignore#Hide() . '^\..*'

setlocal bufhidden=delete

nnoremap <buffer> a <NOP>
nnoremap <buffer> <RightMouse> <NOP>

nnoremap <buffer> <silent> rs :vertical resize 30<CR>
nnoremap <buffer> <silent> h :exec b:netrw_call . 'NetrwHide(1)'<CR>
