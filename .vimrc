" System
set belloff=all
set noerrorbells
set visualbell
set nobackup                " do not store backup files
set autoread                " automatically reload files


" Plugins
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'jaxbot/semantic-highlight.vim'
  Plugin 'ap/vim-css-color'
  Plugin 'junegunn/fzf.vim'
  Plugin 'junegunn/fzf'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
call vundle#end()

filetype plugin on          " support for known file types
filetype plugin indent on   " allow auto-indenting depending on file type

set showcmd


" Appearance
syntax on                                   " syntax highlighting
set guifont=DroidSansMono_Nerd_Font:h11     " font name and size
colorscheme codedark                        " name of color scheme


" GUI Appearance
set guioptions-=m           " no menu bar
set guioptions-=T           " no tool bar
set guioptions-=e           " no tab bar
set guioptions-=r           " no scroll bar
set guioptions=acd          " Auto select, console dialogs, dark theme


" Editor properties
set noswapfile              " do not create swap files
set laststatus=2            " show status line
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching
set number relativenumber   " show line number in current line
set scrolloff=10            " scroll n lines beyond current line
set ignorecase              " case insensitive
set mouse=v                 " middle-click paste with
set hlsearch                " highlight search
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab
set softtabstop=4           " see multiple spaces as tab stops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for indents
set autoindent              " indent a new line the same amount as the line just typed
set wildmode=longest,list   " get bash-like tab completions
set cc=100                  " set an 100 column border
set mouse=a                 " enable mouse click
set encoding=utf-8          " file encoding
set cursorline              " highlight current line
set ttyfast                 " speed up scrolling
set foldmethod=manual       " enable folding
set spell                   " enable spell check (may need to download language package)


" Status line
set statusline=%{StatuslineMode()}
set statusline+=\ \ \       " Separator
set statusline+=%f\ [%n]    " File and buffer
set statusline+=\ \ \       " Separator
set statusline+=%k          " Key map
set statusline+=%=          " Right aligned
set statusline+=%2v\        " current column
set statusline+=[%3l/%3L]   " current line, total lines
set statusline+=\           " Separator
set statusline+=%P          " percentage

hi StatusLine   guifg=#cccccc guibg=#006699
hi StatusLineNC guifg=#777777 guibg=#444444


" Keyboard
let mapleader=' '
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
map <leader>f :call FormatBuffer()<CR>
nmap <leader>s :SemanticHighlightToggle<CR>
nmap <leader>o <Esc>o<Esc>
inoremap <leader>{ {<CR><BS>}<Esc>ko
inoremap jk <ESC>
inoremap { {}<Esc>i
inoremap [ []<Esc>i
inoremap ( ()<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
nmap <S-j> <C-e>
nmap <S-k> <C-y>
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <S-A-o> :execute 'GFiles'<CR>
nmap <S-A-s> :execute ls<CR>

set backspace=eol,start,indent


" autocmd
autocmd BufWritePre *.h,*.hpp,*.c,*.cpp :call FormatBuffer()
autocmd BufWritePre * :%s/\s\+$//e


" Plugin - Semantic Highlight
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


" Plugin - Airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'deus'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' ℅:'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = '☰ '
let g:airline_symbols.dirty='⚡'



" Function definitions

function! StatuslineMode()
  let l:mode=mode()
  if l:mode==#"n"
    return "NORMAL"
  elseif l:mode==?"v"
    return "VISUAL"
  elseif l:mode==#"i"
    return "INSERT"
  elseif l:mode==#"R"
    return "REPLACE"
  elseif l:mode==?"s"
    return "SELECT"
  elseif l:mode==#"t"
    return "TERMINAL"
  elseif l:mode==#"c"
    return "COMMAND"
  elseif l:mode==#"!"
    return "SHELL"
  endif
endfunction

function FormatBuffer()
  if &modified && !empty(findfile('.clang-format', expand('%:p:h') . ';'))
    let cursor_pos = getpos('.')
    :%!clang-format
    call setpos('.', cursor_pos)
  endif
endfunction
