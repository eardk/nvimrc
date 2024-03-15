call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'rust-lang/rust.vim'
Plug 'arzg/vim-rust-syntax-ext'
Plug 'davemo88/rust-fade'
"Plug 'leafgarland/typescript-vim'
"Plug 'tomlion/vim-solidity'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'simrat39/rust-tools.nvim'
Plug 'simrat39/symbols-outline.nvim'
Plug 'ray-x/lsp_signature.nvim'
Plug 'hashivim/vim-terraform'
Plug 'OrangeT/vim-csharp'
Plug 'github/copilot.vim'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

lua require'lspconfig'.rust_analyzer.setup{}
lua require'lspconfig'.pyright.setup{}
lua require'lspconfig'.omnisharp.setup { cmd = { "/usr/local/bin/omnisharp-roslyn/Omnisharp", "--languageserver" , "--hostPID", tostring(pid) }}
lua require'lspconfig'.terraformls.setup{}
lua require'lspconfig'.kotlin_language_server.setup{}
autocmd BufWritePre *.tfvars lua vim.lsp.buf.formatting_sync()
autocmd BufWritePre *.tf lua vim.lsp.buf.formatting_sync()

lua <<EOF
local opts = {
  highlight_hovered_item = true,
  show_guides = true,
  auto_preview = false,
  position = 'right',
  relative_width = true,
  width = 30,
  auto_close = false,
  show_numbers = false,
  show_relative_numbers = false,
  show_symbol_details = true,
  preview_bg_highlight = 'Pmenu',
  autofold_depth = nil,
  auto_unfold_hover = true,
  fold_markers = { '', '' },
  wrap = false,
  keymaps = { -- These keymaps can be a string or a table for multiple keys
    close = {"<Esc>", "q"},
    goto_location = "<Cr>",
    focus_location = "o",
    hover_symbol = "<C-space>",
    toggle_preview = "K",
    rename_symbol = "r",
    code_actions = "a",
    fold = "h",
    unfold = "l",
    fold_all = "W",
    unfold_all = "E",
    fold_reset = "R",
  },
  lsp_blacklist = {},
  symbol_blacklist = {},
  symbols = {
    File = { icon = "-", hl = "@text.uri" },
    Module = { icon = "M", hl = "@namespace" },
    Namespace = { icon = "N", hl = "@namespace" },
    Package = { icon = "P", hl = "@namespace" },
    Class = { icon = "𝓒", hl = "@type" },
    Method = { icon = "λ", hl = "@method" },
    Property = { icon = "x", hl = "@method" },
    Field = { icon = "x", hl = "@field" },
    Constructor = { icon = "λ", hl = "@constructor" },
    Enum = { icon = "ℰ", hl = "@type" },
    Interface = { icon = "I", hl = "@type" },
    Function = { icon = "λ", hl = "@function" },
    Variable = { icon = "x", hl = "@constant" },
    Constant = { icon = "C", hl = "@constant" },
    String = { icon = "𝓐", hl = "@string" },
    Number = { icon = "#", hl = "@number" },
    Boolean = { icon = "⊨", hl = "@boolean" },
    Array = { icon = "", hl = "@constant" },
    Object = { icon = "⦿", hl = "@type" },
    Key = { icon = "🔐", hl = "@type" },
    Null = { icon = "NULL", hl = "@type" },
    EnumMember = { icon = "e", hl = "@field" },
    Struct = { icon = "𝓢", hl = "@type" },
    Event = { icon = "🗲", hl = "@type" },
    Operator = { icon = "+", hl = "@operator" },
    TypeParameter = { icon = "𝙏", hl = "@parameter" },
    Component = { icon = "", hl = "@function" },
    Fragment = { icon = "", hl = "@constant" },
  },
}
require'symbols-outline'.setup(opts)
EOF

filetype plugin indent on
colorscheme csfade

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

let mapleader = ","
nnoremap <silent> <leader>f :FZF<cr>
nnoremap <silent> <leader>F :FZF ~<cr>
nnoremap <silent> <leader>r :Rg<cr>
" nnoremap <silent> <leader>g :Rg<cr>
nnoremap <silent> <leader>t :Tags<cr>
let $FZF_DEFAULT_COMMAND='fd --type f'
"let $FZF_DEFAULT_COMMAND='find . -type f -print -o -type l -print 2> /dev/null | sed s/^..//'

nnoremap <silent> <leader>o :SymbolsOutline<cr>

command W w
command Q q
map <silent> <leader>/ :s/^/\/\//<cr>

set pastetoggle=<F2>
" clipboard
vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>y "+y
nnoremap <leader>yy "+yy
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

" Configure LSP through rust-tools.nvim plugin.
" rust-tools will configure and enable certain LSP features for us.
" See https://github.com/simrat39/rust-tools.nvim#configuration
lua <<EOF
local nvim_lsp = require'lspconfig'

local opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        inlay_hints = {
            show_parameter_hints = true,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
    server = {
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
}

require('rust-tools').setup(opts)
EOF

" Setup Completion
" See https://github.com/hrsh7th/nvim-cmp#basic-configuration
lua <<EOF
local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})
EOF
nnoremap <Space> <NOP>

" Code navigation shortcuts
nnoremap <silent> <c-]> 	<cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     	<cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    	<cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> 	<cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gn 		<cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    	<cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    	<cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    	<cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    	<cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> ga    	<cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> gR    	<cmd>lua vim.lsp.buf.rename()<CR>

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hold
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.diagnostic.goto_next()<CR>

" have a fixed column for the diagnostics to appear in
" this removes the jitter when warnings/errors flow in
set signcolumn=yes

"autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)

" let g:rustfmt_autosave = 1
set expandtab
set nofixendofline
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
