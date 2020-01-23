function! DisplayPath(path)
    return substitute(expand(a:path), $HOME, '~', '')
endfunction

function! Wide()
    let width = winwidth(winnr())
    if width < 80
        return 0
    endif
    return (width > 120) ? 2 : 1
endfunction

function! PlJoin(segments, direction)
    return join(a:segments, (a:direction ? '  ' : '  '))
endfunction

function! PlSep(col, txt, dir)
    return ' %'.a:col.'*'.(a:dir?'':'').'%'.a:txt.'* '
endfunction

function! ReadOnly()
    if &readonly || !&modifiable
        return ''
    else
        return &modified ? '+' : ''
endfunction

function! GitInfo()
    let gitbr = $vcs_info_msg_0_
    if ( gitbr == '')
        return ''
    endif
endfunction

let s:modetext={
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
    let m = mode()
    let slc = get(s:modecolor, m, 7)

    exec 'hi StatusLine ctermfg=' . slc
    exec 'hi User1 ctermfg=' . slc

    let m = get(s:modetext, m, '???')
    return Wide() ? toupper(m) : m[0]
endfunction

function! FileSize()
    let bytes = getfsize(expand('%:p'))
    if (bytes >= 1024)
        let kbytes = bytes / 1024
    endif
    if (exists('kbytes') && kbytes >= 1000)
        let mbytes = kbytes / 1000
    endif

    if bytes <= 0
        return '0'
    endif

    if (exists('mbytes'))
        return mbytes . 'MB'
    elseif (exists('kbytes'))
        return kbytes . 'KB'
    else
        return bytes . 'B'
    endif
endfunction

function! FileInfo()
    let wide = Wide()
    let filesize = FileSize()
    if !wide
        return filesize
    endif

    let info = [empty(&filetype) ? '?' : &filetype, filesize]
    if wide > 1
        let info = [&ff, empty(&fenc) ? &enc : &fenc] + info
    endif
    return PlJoin(info, 1)
endfunction

function! StatusLine(netrw)
    let sl = " %{ModeColor()}" . PlSep(1, 2, 0)
    let sl .= "%<%.30{DisplayPath('%:p:h')}" . PlSep(3, 9, 0)

    if a:netrw
        let sl .= "%=" . PlSep(3, 2, 1)
        let sl .= "%{Wide() ? 'netrw' : '☰'}"
        let sl .= PlSep(1, 0, 1) . "%2p%% "
    else
        let sl .= "%t%=%{ReadOnly()}" . PlSep(3, 2, 1)
        let sl .= "%{FileInfo()}"
        let sl .= PlSep(1, 0, 1) . PlJoin(['%2p%%', '%2c '], 1)
    endif
    return sl
endfunction

function! s:SetStatusLine()
    if &filetype == 'netrw'
        setlocal statusline=%!StatusLine(1)
    else
        setlocal statusline=%!StatusLine(0)
    endif
endfunction

hi User1 ctermbg=10
hi User2 ctermbg=10 ctermfg=7
hi User3 ctermfg=10

augroup statusline
    autocmd!
    autocmd BufAdd,BufEnter * call s:SetStatusLine()
augroup END
