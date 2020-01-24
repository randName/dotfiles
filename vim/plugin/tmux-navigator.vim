if empty($TMUX) || exists("g:tmux_navigator_loaded") || v:version < 700
  finish
endif

if !exists("g:tmux_navigator_disable_when_zoomed")
  let g:tmux_navigator_disable_when_zoomed = 0
endif

if !exists("g:tmux_navigator_resize_amount")
  let g:resize_amount = 5
endif

let s:args = 'select-pane -t ' . shellescape($TMUX_PANE) . ' -'

function! s:PokeEdge(direction, reset)
  let l:nr = winnr()
  silent! execute 'wincmd ' . a:direction
  if l:nr == winnr()
    return 1
  elseif a:reset
    wincmd p
  endif
  return 0
endfunction

function! s:TmuxCommand(args)
  return system('tmux -S ' . split($TMUX, ',')[0] . ' ' . a:args)
endfunction

function! s:IsZoomed()
  return s:TmuxCommand("display -p '#{window_zoomed_flag}'") == 1
endfunction

function! s:TmuxSwitch(direction)
  let l:edge = s:PokeEdge(a:direction, 0)
  if g:tmux_navigator_disable_when_zoomed && s:IsZoomed()
    return
  elseif l:edge
    silent! call s:TmuxCommand(s:args . tr(a:direction, 'hjkl', 'LDUR'))
  endif
endfunction

function! s:TmuxResize(direction, amount)
  let l:resize = 'resize '
  if a:direction == 'h' || a:direction == 'l'
    let l:resize = 'vertical ' . l:resize
  endif

  if s:PokeEdge(a:direction, 1)
    execute l:resize . '-' . a:amount
  else
    let l:rev = tr(a:direction, 'hk', 'lj')
    let l:plus = (a:direction == l:rev || s:PokeEdge(l:rev, 1))
    execute l:resize . (l:plus ? '+' : '-') . a:amount
  endif
endfunction

nnoremap <silent> <C-h> :call <SID>TmuxSwitch('h')<CR>
nnoremap <silent> <C-j> :call <SID>TmuxSwitch('j')<CR>
nnoremap <silent> <C-k> :call <SID>TmuxSwitch('k')<CR>
nnoremap <silent> <C-l> :call <SID>TmuxSwitch('l')<CR>

nnoremap <silent> <C-e>h :call <SID>TmuxResize('h', 1)<CR>
nnoremap <silent> <C-e>j :call <SID>TmuxResize('j', 1)<CR>
nnoremap <silent> <C-e>k :call <SID>TmuxResize('k', 1)<CR>
nnoremap <silent> <C-e>l :call <SID>TmuxResize('l', 1)<CR>

let g:tmux_navigator_loaded = 1
