set statusline=%!StatusLine()

function! StatusLine()
    let sl=' '
    let isep='  '
    let showsec = (winwidth(0) > 80)?1:0
    exe 'hi User1 ctermbg='.(showsec?10:0)
    let m = ModeColor()
    if ( !showsec )
        let m = m[0]
    endif
    let sl .= m
    let sl .= PlSep(1,showsec?2:9,0)
    if ( showsec )
        let sl .= GitInfo()
        let sl .= PlSep(3,9,0)
    endif
    let sl .= '[%n] '
    let sl .= '%<%F'
    let sl .= ReadOnly().' %m %w'
    let sl .= '%='
    if ( showsec )
        let sl .= PlSep(3,2,1)
        let sl .= join([(&fenc!=''?&fenc:&enc), &ff, FileSize()], isep)
    endif
    let sl .= PlSep(1,0,1)
    let sl .= '%3p%%  %l'.isep.'%c '
    return sl
endfunction

function! PlSep(col, txt, dir)
    return ' %'.a:col.'*'.(a:dir?'':'').'%'.a:txt.'* '
endfunction

function! ReadOnly()
    if &readonly || !&modifiable
        return ''
    else
        return ''
endfunction

function! GitInfo()
    let gitbr = $vcs_info_msg_0_
    return ''.gitbr
endfunction

hi User2 ctermbg=10 ctermfg=7
hi User3 ctermfg=10

let g:modetext={
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

let g:modecolor={
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
    let slc = get(g:modecolor, m, 7)
    exe 'hi StatusLine ctermfg='.slc
    exe 'hi User1 ctermfg='.slc
    return toupper(get(g:modetext, m, '???'))
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
