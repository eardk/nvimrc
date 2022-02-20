lua require('plugins')
lua require'lspconfig'.rust_analyzer.setup{}

syntax enable
syntax on
colorscheme fade 

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

let mapleader = ","
nnoremap <silent> <leader>f :FZF<cr>
nnoremap <silent> <leader>F :FZF ~<cr>
let $FZF_DEFAULT_COMMAND='fd --type f'
command W w
command Q q
map <silent> <leader>/ :s/^/\/\//<cr>

set pastetoggle=<F2>
