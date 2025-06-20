" [System]

set belloff=all
set noerrorbells
set visualbell
set nobackup                                " do not store backup files
set autoread                                " automatically reload files
set termguicolors                           " enable 24bit terminal colors


" [Plugins]

filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
  Plugin 'jaxbot/semantic-highlight.vim'
  Plugin 'junegunn/fzf.vim'
  Plugin 'junegunn/fzf'
  Plugin 'ryanoasis/vim-devicons'
  Plugin 'styinx/vim-airline'
  Plugin 'styinx/vim-airline-themes'
  Plugin 'tpope/vim-fugitive'
  Plugin 'tpope/vim-surround'
  Plugin 'VundleVim/Vundle.vim'
call vundle#end()

filetype on
filetype plugin on                          " support for known file types
filetype plugin indent on                   " allow auto-indenting depending on file type

set showcmd                                 " show motion


" [Appearance]

" Syntax and Font
syntax on                                   " syntax highlighting
set guifont=DroidSansM_Nerd_Font:h10.5      " font name and size

" Colors
colorscheme codedark                        " name of color scheme

hi StatusLine               ctermfg=lightgray       ctermbg=lightblue   guifg=#cccccc guibg=#006699
hi StatusLineNC             ctermfg=darkgray        ctermbg=black       guifg=#777777 guibg=#444444

" GUI
set guioptions=acd                          " Auto select, console dialog, dark theme
set guioptions-=e                           " no tab bar
set guioptions-=m                           " no menu bar
set guioptions-=r                           " no scroll bar
set guioptions-=T                           " no tool bar

" Cursor
if &term =~ 'xterm' || &term == 'win32'
  let &t_SI = "\e[5 q"                      " blinking bar cursor when entering insert mode
  let &t_SR = "\e[3 q"                      " blinking underscore cursor when entering replace mode
  let &t_EI = "\e[1 q"                      " blinking block cursor when ending insert or replace mode
  let &t_ti .= "\e[1 q"                     " blinking block cursor when starting termcap
  let &t_te .= "\e[0 q"                     " default terminal cursor when ending termcap
endif


" [Editor]

" ...
set encoding=utf-8                          " file encoding
set nocompatible                            " disable compatibility to old-time vi
set noswapfile                              " do not create swap files
set mouse=a                                 " mouse usable in any mode
set spell                                   " enable spell check (may need to download language package)

" Cursor
set cursorline                              " highlight current line
set number relativenumber                   " show line number in current line
set showmatch                               " show matching symbols
set scrolloff=10                            " scroll n lines beyond current line

" Searching
set hlsearch                                " highlight search
set ignorecase                              " case insensitive
set incsearch                               " incremental search
set smartcase                               " ignore lowercase

" Spacing
set autoindent                              " indent a new line the same amount as the line just typed
set expandtab                               " converts tabs to white space
set shiftwidth=4                            " width for indents
set smarttab                                " auto tabs
set softtabstop=4                           " see multiple spaces as tab stops so <BS> does the right thing
set tabstop=4                               " number of columns occupied by a tab

" Visual
set colorcolumn=100                         " set an 100 column border
set foldmethod=manual                       " enable folding
set laststatus=2                            " always show status line
set showtabline=2                           " always show tab line
set ttyfast                                 " speed up scrolling
set wildmode=longest,list                   " get bash-like tab completions

" Special characters
set list                                    " show special characters
set listchars=eol:¬
set listchars+=extends:›
set listchars+=precedes:‹
set listchars+=space:·
set listchars+=tab:»\
set listchars+=trail:·


" [Keyboard]

" Keymaps
let mapleader=' '
nmap <F8> :TagbarToggle<CR>
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
map <leader>f :call FormatBuffer()<CR>
nmap tj :TagbarOpen('cfj')<CR>
nmap <leader>s :SemanticHighlightToggle<CR>
nmap <leader>o <Esc>o<Esc>
nmap <leader>O <Esc>O<Esc>
nmap <C-j> <C-d>
nmap <C-k> <C-u>
inoremap <leader>{ <Space>{<CR><BS>}<Esc>O
inoremap <leader>[ <Space>[<CR><BS>]<Esc>O
inoremap jk <Esc>
inoremap { {}<Esc>i
inoremap [ []<Esc>i
inoremap ( ()<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i

" Backspace
set backspace=eol,start,indent              " allow backspace to behave normally
set whichwrap+=b                            " allow backspace to move the cursor


" [Plugin - semantic-highlight]

let g:semanticGUIColors = [
  \"#4c93a1","#97a65f","#99b68f","#b0a568","#9d70a8",
  \"#b56069","#6a90af","#9f714e","#b77f69","#7fbe6a",
  \"#79915f","#af7f8e","#4981ab","#ac6a94","#b851b9",
  \"#554759","#715bb2","#774246","#6d8fb6","#b65544",
  \"#578c8d","#579183","#74906f","#519e97","#b58f73",
  \"#8fb95c","#84a19d","#8b5da3","#a67775","#458d77",
  \"#40a6b5","#4c978b","#5873a3","#7cb3a9","#4da9a8",
  \"#764044","#97b49d","#5dbd6c","#6481a3","#b5bc73",
  \"#a56ca1","#779e69","#9d7942","#496ba5","#9a9e93",
  \"#799060","#89aa64","#848162","#874b4d","#b25e5c",
  \"#705461","#8f6db7","#a34b84","#9f4757","#4d6da9",
  \"#bfbbab","#538654","#989f60","#76b3b3","#498798",
  \"#405169","#748191","#57a6a6","#78a542","#62b7aa",
  \"#b68888","#6d55c0","#9c69ba","#6e659c","#4998a8",
  \"#a3b5b9","#40bcae","#77b96c","#bb4d52","#898b4a",
  \"#4aa699","#41a65f","#9a9c6d","#b6998f","#4a9f9a",
  \"#766452","#684585","#4d7982","#988456","#9d75a4",
  \"#415669","#5843a1","#8a4c69","#694375","#7bab9d",
  \"#465972","#9c849a","#4bb4c0","#91924a","#588cae",
  \"#a26759","#499fbc","#62ad56","#7e9095","#bc6984"
\]


" [Plugin - vim-airline]

" airline - configuration
let g:airline_detect_modified =     1
let g:airline_powerline_fonts =     1
let g:airline_inactive_collapse =   1
let g:airline_inactive_alt_sep =    0
let g:airline_skip_empty_sections = 1
let g:airline_left_sep =            ''
let g:airline_left_alt_sep =        ''
let g:airline_right_sep =           ''
let g:airline_right_alt_sep =       ''
let g:airline_theme =               'codedark'

" vim-airline - symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.branch =   ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.dirty =    '⚡'

" vim-airline - extensions
let g:airline#extensions#default#show_devicons =     1
let g:airline#extensions#branch#enabled =            1
let g:airline#extensions#tabline#enabled =           1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#fnamemod =          ':t'
let g:airline#extensions#tabline#show_tabs =         1
let g:airline#extensions#tabline#show_tab_nr =       1
let g:airline#extensions#tabline#tab_nr_type =       1
let g:airline#extensions#tabline#show_buffers =      1
let g:airline#extensions#tabline#buffer_nr_show =    0
let g:airline#extensions#tabline#show_tab_count =    0
let g:airline#extensions#tabline#left_sep =          ''
let g:airline#extensions#tabline#left_alt_sep =      ''
let g:airline#extensions#tabline#right_sep =         ''
let g:airline#extensions#tabline#right_alt_sep =     ''

" vim-airline - sections
let g:airline_section_a       = airline#section#create(['mode'])
let g:airline_section_b       = airline#section#create(['file', ' ', 'readonly'])
let g:airline_section_c       = airline#section#create(['branch'])
let g:airline_section_x       = airline#section#create(['%{&fileencoding}', ' ', '%{WebDevIconsGetFileFormatSymbol()}'])
let g:airline_section_y       = airline#section#create(['%{WebDevIconsGetFileTypeSymbol()}'])
let g:airline_section_z       = airline#section#create(['%c', ' %l/%L ', '%P'])


" [Plugin - vim-devicons]
"
let g:webdevicons_enable = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_airline_statusline_fileformat_symbols = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsTabAirLineBeforeGlyphPadding = ' '
let g:WebDevIconsTabAirLineAfterGlyphPadding = ' '


" [Functions]

" Format c,c++ files
function FormatBuffer()
  if &modified && !empty(findfile('.clang-format', expand('%:p:h') . ';'))
    let cursor_pos = getpos('.')
    :%!clang-format
    call setpos('.', cursor_pos)
  endif
endfunction


" [autocmd]

" Formatting
augroup Formatting
  autocmd!
  autocmd BufWritePre *.h,*.hpp,*.c,*.cpp :call FormatBuffer()
augroup END

