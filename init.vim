syntax on
set number
set relativenumber
set incsearch
set ignorecase
set noswapfile
set hlsearch

inoremap jk <Esc> 

call plug#begin()
Plug 'https://github.com/kyazdani42/nvim-web-devicons'
Plug 'https://github.com/kyazdani42/nvim-tree.lua'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/airblade/vim-gitgutter'
Plug 'https://github.com/vim-syntastic/syntastic'
Plug 'https://github.com/preservim/tagbar'
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'https://github.com/ycm-core/YouCompleteMe'
Plug 'https://github.com/tpope/vim-surround'
call plug#end()

