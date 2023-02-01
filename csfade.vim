" Vim color file
" :so $VIMRUNTIME/syntax/hitest.vim to see all active groups


set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

set t_Co=256
let g:colors_name = "csfade"

hi Normal ctermfg=188 ctermbg=234 cterm=NONE guifg=#f8f8f2 guibg=#272822 gui=NONE
hi Cursor ctermfg=235 ctermbg=231 cterm=NONE guifg=#272822 guibg=#f8f8f0 gui=NONE
hi Visual ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#49483e gui=NONE
hi CursorLine ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#3c3d37 gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#3c3d37 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#3c3d37 gui=NONE
hi LineNr ctermfg=102 ctermbg=237 cterm=NONE guifg=#90908a guibg=#3c3d37 gui=NONE
hi VertSplit ctermfg=233 ctermbg=233 cterm=NONE guifg=#64645e guibg=#64645e gui=NONE
hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#49483e gui=NONE
hi IncSearch term=reverse cterm=reverse ctermfg=193 ctermbg=16 gui=reverse guifg=#C4BE89 guibg=#000000
hi Search term=reverse cterm=NONE ctermfg=231 ctermbg=24 gui=NONE guifg=#f8f8f2 guibg=#204a87
hi Folded ctermfg=242 ctermbg=235 cterm=NONE guifg=#75715e guibg=#272822 gui=NONE
hi Comment ctermfg=242 ctermbg=NONE cterm=NONE guifg=#75715e guibg=NONE gui=NONE
hi SpecialComment ctermfg=242 ctermbg=NONE cterm=NONE guifg=#75715e guibg=NONE gui=NONE
hi Constant ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Keyword ctermfg=227
hi Statement ctermfg=227

hi StatusLine ctermfg=188 ctermbg=233 cterm=bold guifg=#f8f8f2 guibg=#64645e gui=bold
hi StatusLineNC ctermfg=188 ctermbg=233 cterm=NONE guifg=#f8f8f2 guibg=#64645e gui=NONE
hi DiffAdd ctermfg=231 ctermbg=64 cterm=bold guifg=#f8f8f2 guibg=#46830c gui=bold
hi DiffChange ctermfg=NONE ctermbg=NONE cterm=NONE guifg=#f8f8f2 guibg=#243955 gui=NONE
hi DiffText ctermfg=231 ctermbg=24 cterm=bold guifg=#f8f8f2 guibg=#204a87 gui=bold
hi Title ctermfg=231 ctermbg=NONE cterm=bold guifg=#f8f8f2 guibg=NONE gui=bold
hi Directory ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE

hi Boolean ctermfg=077 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi Character ctermfg=077 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi Number ctermfg=077 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi Float ctermfg=077 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE

hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE guifg=#8b0797 guibg=NONE gui=NONE

hi NonText ctermfg=188

hi SignColumn ctermfg=NONE ctermbg=233 cterm=NONE guifg=NONE guibg=#3c3d37 gui=NONE

hi Error ctermfg=NONE ctermbg=064
hi SpellBad ctermfg=NONE ctermbg=016
hi YcmErrorSign ctermfg=NONE ctermbg=064 cterm=italic
hi SpellCap ctermfg=NONE ctermbg=016
hi YcmWarningSign ctermfg=064 ctermbg=233 cterm=italic

hi Todo ctermfg=95 ctermbg=NONE cterm=inverse,bold guifg=#75715e guibg=NONE gui=inverse,bold

hi MatchParen ctermfg=077 ctermbg=NONE cterm=underline 

hi Function ctermfg=188 ctermbg=NONE cterm=NONE
hi Keyword ctermfg=227 ctermbg=NONE cterm=NONE 

hi String ctermfg=077 ctermbg=NONE cterm=NONE

hi NERDTreeFile ctermfg=188
hi NERDTreeExecFile ctermfg=077

" rust syntax ext
hi rsAttribute ctermfg=227
hi rsComment ctermfg=242
hi rsDelimiter ctermfg=187
hi rsFor ctermfg=227
hi rsWhile ctermfg=227
hi rsUse ctermfg=227
hi rsMut ctermfg=079 
hi rsMatch ctermfg=227
hi rsIf ctermfg=227
hi rsElse ctermfg=227
hi rsLoop ctermfg=227
hi rsModule ctermfg=176
hi rsIdentifier ctermfg=188
hi rsIdentDef ctermfg=188
hi rsUnusedIdentDef ctermfg=188
hi rsFieldAccess ctermfg=188
hi rsFuncDef ctermfg=077
hi rsLibraryMacro ctermfg=227
hi rsLibraryType ctermfg=176
hi rsUserConst ctermfg=077
hi rsUserType ctermfg=176
hi rsUserIdent ctermfg=188
hi rsForeignMacro ctermfg=227
hi rsForeignType ctermfg=176
hi rsCrateType ctermfg=176
hi rsTypeDef ctermfg=077
hi rsUnusedTypeDef ctermfg=176
hi rsTypeParamDef ctermfg=176
hi rsOperator ctermfg=079 

" python
hi def link pythonFunction rsFuncDef
hi def link pythonBuiltin  rsFor

"cs
hi def link csAsyncOperator rsMatch
hi def link csClass rsUserType
hi def link csIface rsUserType
hi def link csNewDecleration Keyword
hi def link csConstant rsUserConst
hi def link csModifier Keyword
hi def link csTypeDecleration Keyword
hi def link csType Keyword
hi def link csStorage Keyword
hi def link csXmlComment Normal
hi def link xmlTag Normal
hi def link xmlAttrib Normal
