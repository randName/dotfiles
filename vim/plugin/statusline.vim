if exists('g:loaded_statusline')
  finish
endif

function! s:Join(segments, direction)
  return join(a:segments, (a:direction ? '  ' : '  '))
endfunction

function! s:Sep(color, text, direction)
  return ' %' . a:color . '*' . (a:direction ? '' : '') . '%' . a:text. '* '
endfunction

function! s:Wide()
  let l:width = winwidth(winnr())
  if l:width < 80
    return 0
  endif
  return (l:width - 40) / 40
endfunction

function! s:FileSize()
  let l:bytes = getfsize(expand('%:p'))
  if l:bytes <= 0
    return '0'
  elseif l:bytes >= 1024
    let l:kb = l:bytes / 1024
    if l:kb >= 1000
      return (l:kb / 1000) . 'MB'
    endif
    return l:kb . 'KB'
  endif
  return l:bytes . 'B'
endfunction

let s:modetext={
    \ 't' : 'Term',
    \ '!' : 'Shell',
    \ 'c' : 'Command',
    \ 'n' : 'Normal',
    \ 'no': 'Op Pending',
    \ 'i' : 'Insert',
    \ 'R' : 'Replace',
    \ 'Rv': 'V·Replace',
    \ 'v' : 'Visual',
    \ 'V' : 'V·Line',
    \ '': 'V·Block',
\}

let s:modecolor={
    \ 't' : 1,
    \ '!' : 1,
    \ 'c' : 1,
    \ 'n' : 4,
    \ 'no': 4,
    \ 'i' : 2,
    \ 'R' : 3,
    \ 'Rv': 9,
    \ 'v' : 9,
    \ 'V' : 9,
    \ '': 9,
\}

function! ModeColor()
  let l:m = mode()
  let l:c = get(s:modecolor, l:m, 7)

  exec 'hi StatusLine ctermfg=' . l:c
  exec 'hi User1 ctermfg=' . l:c

  let l:m = get(s:modetext, l:m, mode())
  return s:Wide() ? toupper(l:m) : l:m[0]
endfunction

function! DisplayPath()
  if &buftype == 'terminal'
    return expand('%')[1:]
  endif

  let l:path = substitute(expand('%:p:h'), $HOME, '~', '')
  if s:Wide() < 2
    return l:path
  endif
  return s:Join(split(l:path, '/'), 0)
endfunction

function! ReadOnly()
  if &readonly || !&modifiable
    return ''
  endif
  return &modified ? '+' : ''
endfunction

function! FileInfo()
  let l:wide = s:Wide()
  if &filetype == 'netrw'
    return l:wide ? 'netrw' : '☰'
  endif

  if &buftype == 'terminal'
    return l:wide ? 'terminal' : '☰'
  endif

  let l:filesize = s:FileSize()
  if !l:wide
    return l:filesize
  endif

  let l:info = [empty(&filetype) ? '?' : &filetype, l:filesize]
  if l:wide > 1
    let l:info = [&ff, empty(&fenc) ? &enc : &fenc] + l:info
  endif
  return s:Join(l:info, 1)
endfunction

function! StatusLine(normal)
  let l:pos = ['%2p%% ']
  let l:spacer = "%="

  if a:normal
    let l:pos = ['%2c'] + l:pos
    let l:spacer = "%t %{ReadOnly()}" . l:spacer
  endif

  let l:sl = " %{ModeColor()}"
  let l:sl .= s:Sep(1, 2, 0) . "%<%{DisplayPath()}"
  let l:sl .= s:Sep(3, 9, 0) . l:spacer
  let l:sl .= s:Sep(3, 2, 1) . "%{FileInfo()}"
  let l:sl .= s:Sep(1, 0, 1) . s:Join(l:pos, 1)
  return l:sl
endfunction

function! s:SetStatusLine()
  if &filetype == 'netrw'
    setlocal statusline=%!StatusLine(0)
    return
  endif

  if exists('b:statusline')
    return
  endif
  setlocal statusline=%!StatusLine(1)
  let b:statusline=1
endfunction

hi! default link StatusLineTerm StatusLine
hi! default link StatusLineTermNC StatusLineNC

hi User1 ctermbg=10
hi User2 ctermbg=10 ctermfg=7
hi User3 ctermfg=10

augroup statusline
  autocmd!
  autocmd BufAdd,BufEnter * call s:SetStatusLine()
  autocmd TerminalOpen * if &buftype == 'terminal' | setlocal statusline=%!StatusLine(0) | endif
augroup END

let g:loaded_statusline = 1
