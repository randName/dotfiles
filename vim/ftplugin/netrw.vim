function! s:FindNetrw()
  redir => scriptnames
  silent! scriptnames
  redir END
  for script in split(l:scriptnames, '\n')
    if l:script =~ 'autoload/netrw.vim'
      return str2nr(split(l:script, ':')[0])
    endif
  endfor
endfunction

let b:netrw_call = ':call <SNR>' . s:FindNetrw() . '_'

setlocal bufhidden=delete

nnoremap <buffer> a <NOP>
nnoremap <buffer> <RightMouse> <NOP>

nnoremap <buffer> <silent> rs :vertical resize 30<CR>
nnoremap <buffer> <silent> h :exec b:netrw_call . 'NetrwHide(1)'<CR>
