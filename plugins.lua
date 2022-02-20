return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'neovim/nvim-lspconfig'
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'
    use 'rust-lang/rust.vim'
    use 'arzg/vim-rust-syntax-ext'
    use 'davemo88/rust-fade'
    use 'leafgarland/typescript-vim'
    use 'tomlion/vim-solidity'
end)
