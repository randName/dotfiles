" Language: OpenGL ES Shading Language 1.00

if exists("b:current_syntax")
  finish
endif

" Statements
syn keyword glslRepeat      for while do
syn keyword glslConditional if else switch case default
syn keyword glslStatement   discard return break continue

" Comments
syn keyword glslTodo     contained TODO FIXME XXX NOTE
syn region  glslCommentL start="//" skip="\\$" end="$" keepend contains=glslTodo,@Spell
syn region  glslComment  matchgroup=glslCommentStart start="/\*" end="\*/" extend contains=glslTodo,@Spell

" Preprocessor
syn keyword glslMacro        __LINE__ __FILE__ __VERSION__ GL_ES
syn region  glslDefine       start="^\s*#\s*\(define\|undef\)" skip="\\$" end="$" keepend
syn region  glslPreCondit    start="^\s*#\s*\(if\|ifdef\|ifndef\|else\|elif\|endif\)" skip="\\$" end="$" keepend
syn region  glslPreProc      start="^\s*#\s*\(error\|pragma\|extension\|version\|line\)" skip="\\$" end="$" keepend

" Boolean Constants
syn keyword glslBoolean true false

" Integer Numbers
syn match glslDecimalInt display "\<\(0\|[1-9]\d*\)[uU]\?"
syn match glslOctalInt   display "\<0\o\+[uU]\?"
syn match glslHexInt     display "\<0[xX]\x\+[uU]\?"

" Float Numbers
syn match glslFloat display "\<\d\+\.\([eE][+-]\=\d\+\)\=\(lf\|LF\|f\|F\)\="
syn match glslFloat display "\<\.\d\+\([eE][+-]\=\d\+\)\=\(lf\|LF\|f\|F\)\="
syn match glslFloat display "\<\d\+[eE][+-]\=\d\+\(lf\|LF\|f\|F\)\="
syn match glslFloat display "\<\d\+\.\d\+\([eE][+-]\=\d\+\)\=\(lf\|LF\|f\|F\)\="

" Swizzles
syn match glslSwizzle display /\.[xyzw]\{1,4\}\>/
syn match glslSwizzle display /\.[rgba]\{1,4\}\>/
syn match glslSwizzle display /\.[stpq]\{1,4\}\>/

" Structure
syn keyword glslStructure struct nextgroup=glslIdentifier skipwhite skipempty

syn match glslIdentifier contains=glslIdentifierPrime "\%([a-zA-Z_]\)\%([a-zA-Z0-9_]\)*" display contained

" Types
syn keyword glslType void
syn keyword glslType bool int float
syn keyword glslType mat2 mat3 mat4
syn keyword glslType vec2 vec3 vec4
syn keyword glslType ivec2 ivec3 ivec4
syn keyword glslType bvec2 bvec3 bvec4
syn keyword glslType sampler2D samplerCube

" Qualifiers
syn keyword glslQualifier in inout out
syn keyword glslQualifier precision highp mediump lowp
syn keyword glslQualifier const attribute uniform varying
syn keyword glslQualifier invariant

" Built-in Constants
syn keyword glslBuiltinConstant gl_MaxVertexAttribs
syn keyword glslBuiltinConstant gl_MaxVertexUniformVectors
syn keyword glslBuiltinConstant gl_MaxVaryingVectors
syn keyword glslBuiltinConstant gl_MaxTextureImageUnits
syn keyword glslBuiltinConstant gl_MaxCombinedTextureImageUnits
syn keyword glslBuiltinConstant gl_MaxFragmentUniformVectors
syn keyword glslBuiltinConstant gl_MaxDrawBuffers

" Built-in Variables
syn keyword glslBuiltinVariable gl_Position
syn keyword glslBuiltinVariable gl_PointSize
syn keyword glslBuiltinVariable gl_PointCoord
syn keyword glslBuiltinVariable gl_FragColor
syn keyword glslBuiltinVariable gl_FragCoord
syn keyword glslBuiltinVariable gl_FragData
syn keyword glslBuiltinVariable gl_FrontFacing
syn keyword glslBuiltinVariable gl_DepthRange
syn keyword glslBuiltinVariable gl_DepthRangeParameters

" Built-in Functions
syn keyword glslBuiltinFunction any all not
syn keyword glslBuiltinFunction matrixCompMult
syn keyword glslBuiltinFunction textureCube textureCubeLod
syn keyword glslBuiltinFunction pos exp log exp2 log2 sqrt inversesqrt
syn keyword glslBuiltinFunction radians degrees sin cos tan asin acos atan
syn keyword glslBuiltinFunction texture2D texture2DLod texture2DProj texture2DProjLod
syn keyword glslBuiltinFunction abs sign floor ceil fract mod min max clamp mix step smoothstep
syn keyword glslBuiltinFunction length distance dot cross normalize faceforward reflect refract
syn keyword glslBuiltinFunction lessThan lessThanEqual greaterThan greaterThanEqual equal notEqual

hi def link glslConditional     Conditional
hi def link glslRepeat          Repeat
hi def link glslStatement       Statement
hi def link glslTodo            Todo
hi def link glslCommentL        glslComment
hi def link glslCommentStart    glslComment
hi def link glslComment         Comment
hi def link glslPreCondit       PreCondit
hi def link glslDefine          Define
hi def link glslMacro           Macro
hi def link glslPreProc         PreProc
hi def link glslBoolean         Boolean
hi def link glslDecimalInt      glslInteger
hi def link glslOctalInt        glslInteger
hi def link glslHexInt          glslInteger
hi def link glslInteger         Number
hi def link glslFloat           Float
hi def link glslIdentifierPrime glslIdentifier
hi def link glslIdentifier      Identifier
hi def link glslStructure       Structure
hi def link glslType            Type
hi def link glslQualifier       StorageClass
hi def link glslBuiltinConstant Constant
hi def link glslBuiltinFunction Function
hi def link glslBuiltinVariable Identifier
hi def link glslSwizzle         Identifier

let b:current_syntax = "glsl"
