" Vim syntax file
" Language:  OpenSCAD
" Version:   v2019.05

if exists("b:current_syntax")
  finish
endif

"syn keyword openscadFunctionDef function
syn keyword openscadFunctionDef function nextgroup=openscadFunction skipwhite skipempty
syn match openscadFunction /\<\h\w*\>/ contained display

"syn keyword openscadModuleDef module
syn keyword openscadModuleDef module nextgroup=openscadModule skipwhite skipempty
syn match openscadModule /\<\h\w*\>/ contained display

syn match openscadSpecial "\$[a-zA-Z]\+\>" display
syn match openscadModifier "^\s*[\*\!\#\%]" display

syn keyword openscadConstant PI undef
syn keyword openscadBoolean true false

syn match openscadNumbers "\<\d\|\.\d" contains=openscadNumber display transparent
syn match openscadNumber "\.\d\+" display contained
syn match openscadNumber "\d\+" display contained

syn region openscadString start=/"/ skip=/\\"/ end=/"/

syn keyword openscadCommentTodo TODO FIXME XXX contained display
syn region openscadBlockComment start=:/\*: end=:\*/: fold contains=openscadCommentTodo
syn match openscadInlineComment ://.*$: contains=openscadCommentTodo

syn region openscadBlock start="{" end="}" transparent fold
syn region openscadVector start="\[" end="\]" transparent fold

syn keyword openscadStatement echo let
syn keyword openscadInclude include use
syn keyword openscadImport import children
syn keyword openscadConditional if else
syn keyword openscadRepeat for intersection_for each

syn keyword openscadBuiltin echo assert render parent_module
syn keyword openscadBuiltin str len chr ord concat search lookup
syn keyword openscadBuiltin dxf_cross dxf_dim version version_num
syn keyword openscadBuiltin is_undef is_bool is_num is_string is_list
syn keyword openscadBuiltin abs sign floor round ceil max min rands norm cross
syn keyword openscadBuiltin sin cos tan acos asin atan atan2 ln log pow exp sqrt

syn keyword openscadCsgBoolean union difference intersection
syn keyword openscadPrimitive2D square circle polygon import_dxf text projection
syn keyword openscadPrimitive3D cube sphere cylinder polyhedron surface linear_extrude rotate_extrude
syn keyword openscadTransform translate rotate scale resize mirror multmatrix color offset hull minkowski

hi def link openscadString          String
hi def link openscadNumber          Number
hi def link openscadNumbers         Number
hi def link openscadBoolean         Boolean
hi def link openscadConstant        Constant
hi def link openscadSpecial         Special
hi def link openscadModifier        Special
hi def link openscadInclude         Include
hi def link openscadBuiltin         Operator
hi def link openscadRepeat          Repeat
hi def link openscadConditional     Conditional
hi def link openscadCommentTodo     Todo
hi def link openscadBlockComment    Comment
hi def link openscadInlineComment   Comment
hi def link openscadImport          Keyword
hi def link openscadCsgBoolean      Keyword
hi def link openscadPrimitive3D     Keyword
hi def link openscadPrimitive2D     Keyword
hi def link openscadTransform       Statement
hi def link openscadStatement       Statement
hi def link openscadModule          Function
hi def link openscadModuleDef       Structure
hi def link openscadFunction        Function
hi def link openscadFunctionDef     Structure

if exists("openscad_space_errors")
  if !exists("openscad_no_trail_space_error")
    syn match openscadSpaceError display excludenl "\s\+$"
  endif
  if !exists("openscad_no_tab_space_error")
    syn match openscadSpaceError display " \+\t"me=e-1
  endif
endif

let b:current_syntax = "openscad"
