" skip if not run from git directory
if empty(system("git rev-parse --git-dir 2> /dev/null"))
  finish
endif

setlocal updatetime=200

let g:gitgutter_sign_modified_removed='≠'

packadd vim-gitgutter
