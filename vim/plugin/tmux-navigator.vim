if empty($TMUX) || exists("g:tmux_navigator_loaded") || v:version < 700
  finish
endif

if !exists("g:tmux_navigator_disable_when_zoomed")
  let g:tmux_navigator_disable_when_zoomed = 0
endif

if !exists("g:tmux_navigator_resize_amount")
  let g:tmux_navigator_resize_amount = 1
endif

if !exists("g:tmux_navigator_auto_resize")
  let g:tmux_navigator_auto_resize = 1
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
  let l:ori_ft = &filetype
  let l:edge = s:PokeEdge(a:direction, 0)
  if g:tmux_navigator_disable_when_zoomed && s:IsZoomed()
    return
  elseif l:edge
    silent! call s:TmuxCommand(s:args . tr(a:direction, 'hjkl', 'LDUR'))
  elseif g:tmux_navigator_auto_resize
    if &filetype == 'netrw' || l:ori_ft == 'netrw'
      return
    endif
    if a:direction =~ '[hl]'
      execute 'vertical resize ' . min([max([float2nr(&columns * 0.6), 80]), 140])
    else
      execute 'resize ' . min([max([float2nr(&lines * 0.6), 20]), 50])
    endif
  endif
endfunction

function! s:TmuxResize(direction, amount)
  if winnr('$') == 1
    return
  endif
  let l:resize = 'resize '
  if a:direction =~ '[hl]'
    let l:resize = 'vertical ' . l:resize
  endif

  let l:amount = a:amount ? a:amount : g:tmux_navigator_resize_amount

  let l:fwd = s:PokeEdge(a:direction, 1)
  let l:rev = s:PokeEdge(tr(a:direction, 'hjkl', 'lkjh'), 1)

  if l:fwd && l:rev
    return
  elseif l:fwd
    execute l:resize . '-' . l:amount
  else
    let l:plus = (a:direction =~ '[hk]' || l:rev)
    execute l:resize . (l:plus ? '+' : '-') . l:amount
  endif
endfunction

nnoremap <silent> <Plug>(TmuxSwitchH) :call <SID>TmuxSwitch('h')<CR>
nnoremap <silent> <Plug>(TmuxSwitchJ) :call <SID>TmuxSwitch('j')<CR>
nnoremap <silent> <Plug>(TmuxSwitchK) :call <SID>TmuxSwitch('k')<CR>
nnoremap <silent> <Plug>(TmuxSwitchL) :call <SID>TmuxSwitch('l')<CR>

nnoremap <silent> <Plug>(TmuxResizeH) :call <SID>TmuxResize('h', 0)<CR>
nnoremap <silent> <Plug>(TmuxResizeJ) :call <SID>TmuxResize('j', 0)<CR>
nnoremap <silent> <Plug>(TmuxResizeK) :call <SID>TmuxResize('k', 0)<CR>
nnoremap <silent> <Plug>(TmuxResizeL) :call <SID>TmuxResize('l', 0)<CR>

if !get(g:, 'tmux_navigator_no_mappings', 0)
  nmap <C-h> <Plug>(TmuxSwitchH)
  nmap <C-j> <Plug>(TmuxSwitchJ)
  nmap <C-k> <Plug>(TmuxSwitchK)
  nmap <C-l> <Plug>(TmuxSwitchL)

  nmap h <Plug>(TmuxResizeH)
  nmap j <Plug>(TmuxResizeJ)
  nmap k <Plug>(TmuxResizeK)
  nmap l <Plug>(TmuxResizeL)
endif

let g:tmux_navigator_loaded = 1
