if !exists('g:indent_guides_ignore_filetypes')
  let g:indent_guides_ignore_filetypes = ['netrw', 'help', 'text']
endif

if !exists('g:indent_guides_max_indent_level')
  let g:indent_guides_max_indent_level = 10
endif

if !exists('g:indent_guides_start_enabled')
  let g:indent_guides_start_enabled = 1
endif

if !exists('g:indent_guides_guide_size')
  let g:indent_guides_guide_size = 1
endif

function! s:HighlightPattern(pattern, start, size)
  let l:pattern = '^' . a:pattern . '*\%' . a:start . 'v\zs'
  let l:pattern .= a:pattern . '*\%' . (a:start + a:size)
  return l:pattern . 'v\ze'
endfunction

function! s:HideGuides()
  let b:indent_guide_enabled = 0
  if empty(b:indent_guide_matches)
    return
  endif

  let l:idx = 0
  for l:mid in b:indent_guide_matches
    try
      call matchdelete(l:mid)
    catch /E803:/
      " Do nothing
    endtry
    call remove(b:indent_guide_matches, l:idx)
    let l:idx += l:idx
  endfor
endfunction

function! s:InitGuides()
  if index(g:indent_guides_ignore_filetypes, &filetype) > -1
    return
  endif

  if &shiftwidth > 0 && &expandtab
    let b:indent_size = &shiftwidth
  else
    let b:indent_size = &tabstop
  endif

  let b:guide_size = g:indent_guides_guide_size
  if b:guide_size == 0 || b:guide_size > b:indent_size
    let b:guide_size = b:indent_size
  endif

  let b:alternate = (b:indent_size / b:guide_size) <= 2

  let b:indent_guide_matches = []
  if g:indent_guides_start_enabled
    call s:ShowGuides()
  endif
endfunction

function s:ShowGuides()
  let b:indent_guide_enabled = 1
  for l:level in range(2, g:indent_guides_max_indent_level)
    if (l:level % 2) && b:alternate
      continue
    endif
    let l:start = (l:level - 1) *  b:indent_size + 1
    let l:pattern = s:HighlightPattern('\s', l:start, b:guide_size)
    call add(b:indent_guide_matches, matchadd('IndentGuide', l:pattern))
  endfor
endfunction

function s:ToggleGuides()
  if b:indent_guide_enabled
    call s:HideGuides()
  else
    call s:ShowGuides()
  endif
endfunction

hi IndentGuide ctermbg=0

augroup indent_guides
  autocmd!
  autocmd! BufNewFile,BufRead * :call s:InitGuides()
augroup END

nnoremap <silent> <Plug>(IndentGuidesShow) :call <SID>ShowGuides()<CR>
nnoremap <silent> <Plug>(IndentGuidesHide) :call <SID>HideGuides()<CR>
nnoremap <silent> <Plug>(IndentGuidesToggle) :call <SID>ToggleGuides()<CR>

nmap <leader>ig <Plug>(IndentGuidesToggle)
