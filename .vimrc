" vim: et ts=2 sts=2 sw=2

" [System]

set belloff=all
set noerrorbells
set visualbell
set nobackup                                " do not store backup files
set autoread                                " automatically reload files
set termguicolors                           " enable 24bit terminal colors


" [Plugins]
"
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
  Plugin 'jaxbot/semantic-highlight.vim'
  Plugin 'junegunn/fzf.vim'
  Plugin 'junegunn/fzf'
  Plugin 'VundleVim/Vundle.vim'
call vundle#end()

filetype on
filetype plugin on                          " support for known file types
filetype plugin indent on                   " allow auto-indenting depending on file type

set showcmd


" [Appearance]

" Syntax and Font
syntax on                                   " syntax highlighting
set guifont=DroidSansM_Nerd_Font:h10.5      " font name and size

" Colors
colorscheme codedark                        " name of color scheme

hi StatusLine               ctermfg=lightgray       ctermbg=lightblue   guifg=#cccccc guibg=#006699
hi StatusLineNC             ctermfg=darkgray        ctermbg=black       guifg=#777777 guibg=#444444

hi colorTabLine             ctermfg=lightgray       ctermbg=darkgray    guifg=#cccccc guibg=#333333
hi colorTabActive           ctermfg=darkgray        ctermbg=lightblue   guifg=#111111 guibg=#4499ee term=bold cterm=bold gui=bold
hi colorTabInactive         ctermfg=gray            ctermbg=darkgray    guifg=#999999 guibg=#333333

hi colorStatusLineNormal    ctermfg=darkgray        ctermbg=lightblue   guifg=#111111 guibg=#5599dd term=bold cterm=bold gui=bold
hi colorStatusLineInsert    ctermfg=darkgray        ctermbg=darkyellow  guifg=#111111 guibg=#ccaa22 term=bold cterm=bold gui=bold
hi colorStatusLineVisual    ctermfg=darkgray        ctermbg=darkmagenta guifg=#111111 guibg=#cc88cc term=bold cterm=bold gui=bold
hi colorStatusLineReplace   ctermfg=darkgray        ctermbg=lightred    guifg=#111111 guibg=#cc9977 term=bold cterm=bold gui=bold
hi colorStatusLineSelect    ctermfg=darkgray        ctermbg=darkblue    guifg=#111111 guibg=#999999 term=bold cterm=bold gui=bold
hi colorStatusLineCommand   ctermfg=darkgray        ctermbg=lightgreen  guifg=#111111 guibg=#669955 term=bold cterm=bold gui=bold
hi colorStatusLineTerminal  ctermfg=darkgray        ctermbg=darkblue    guifg=#111111 guibg=#999999 term=bold cterm=bold gui=bold
hi colorStatusLineShell     ctermfg=darkgray        ctermbg=darkblue    guifg=#111111 guibg=#999999 term=bold cterm=bold gui=bold

hi colorStatusLine          ctermfg=lightgray       ctermbg=darkgray    guifg=#cccccc guibg=#333333
hi colorStatusLineGray      ctermfg=lightgray       ctermbg=darkgray    guifg=#999999 guibg=#333333
hi colorStatusLineRed       ctermfg=lightred        ctermbg=darkred     guifg=#CC3333 guibg=#330000
hi colorStatusLineGreen     ctermfg=lightgreen      ctermbg=darkgreen   guifg=#00AA00 guibg=#003300
hi colorStatusLineBlue      ctermfg=lightblue       ctermbg=darkblue    guifg=#0099CC guibg=#002244
hi colorStatusLineMagenta   ctermfg=lightmagenta    ctermbg=darkmagenta guifg=#CC0099 guibg=#440022
hi colorStatusLinePurple    ctermfg=lightmagenta    ctermbg=darkmagenta guifg=#9900CC guibg=#220044
hi colorStatusLineCyan      ctermfg=lightcyan       ctermbg=darkcyan    guifg=#00CCCC guibg=#004444

" GUI
set guioptions=acd                          " Auto select, console dialog, dark theme
set guioptions-=e                           " no tab bar
set guioptions-=m                           " no menu bar
set guioptions-=r                           " no scroll bar
set guioptions-=T                           " no tool bar

" Cursor
"set guicursor=n-c-v:block-Cursor           " in normal mode use block cursor
"set guicursor+=i:ver100-iCursor
"set guicursor+=n-v-c:blinkon0
"set guicursor+=i:blinkwait10

let &t_SI .= "\e[5 q"                       " bar cursor when starting insert mode
let &t_EI .= "\e[1 q"                       " bar cursor when ending insert mode


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


" [Plugin - Semantic Highlight]

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


" [Functions]

" Format c,c++ files
function FormatBuffer()
  if &modified && !empty(findfile('.clang-format', expand('%:p:h') . ';'))
    let cursor_pos = getpos('.')
    :%!clang-format
    call setpos('.', cursor_pos)
  endif
endfunction


" [Functions - Statusline and Tabline]

let g:last_color = 'colorStatusLineGray'
let g:path = ''
let g:branch = ''

" Blend between two background colors
function HiBlend(a, b, inverse=0)
    let l:a = a:a
    let l:b = a:b
    if a:inverse == 1
      let l:a = a:b
      let l:b = a:a
    endif

    let l:ha = execute('hi ' . l:a)
    let l:hb = execute('hi ' . l:b)
    let l:ctermfg = matchstr(l:ha, 'ctermbg=\zs\S*')
    let l:ctermbg = matchstr(l:hb, 'ctermbg=\zs\S*')
    let l:guifg = matchstr(l:ha, 'guibg=\zs\S*')
    let l:guibg = matchstr(l:hb, 'guibg=\zs\S*')
    call execute(printf("hi %sBlend%s ctermfg=%s ctermbg=%s guifg=%s guibg=%s", l:a, l:b, l:ctermfg, l:ctermbg, l:guifg, l:guibg))
    return l:a . 'Blend' . l:b
endfunction

" Return vim mode and its color
function StatusLineVimMode()
  let l:modes = {
    \ 'n'  : ['NORMAL',   'colorStatusLineNormal'],
    \ 'i'  : ['INSERT',   'colorStatusLineInsert'],
    \ 'v'  : ['VISUAL',   'colorStatusLineVisual'],
    \ 'V'  : ['VISUAL',   'colorStatusLineVisual'],
    \ '' : ['VISUAL',   'colorStatusLineVisual'],
    \ 'R'  : ['REPLACE',  'colorStatusLineReplace'],
    \ 's'  : ['SELECT',   'colorStatusLineSelect'],
    \ 'S'  : ['SELECT',   'colorStatusLineSelect'],
    \ '' : ['SELECT',   'colorStatusLineSelect'],
    \ 'c'  : ['COMMAND',  'colorStatusLineCommand'],
    \ 't'  : ['TERMINAL', 'colorStatusLineTerminal'],
    \ '!'  : ['SHELL',    'colorStatusLineShell'],
    \ '-'  : ['-',        'colorStatusLineNormal']
  \ }

  let l:mode = get(l:modes, mode(), '-')
  let l:name = l:mode[0]
  let l:color = l:mode[1]

  return [printf('%-8s', l:name), l:color]
endfunction

" Return git branch and its color
function StatusLineGitBranch()
  let l:path = expand('%:p:h:S')
  if g:path != l:path
    let g:path = l:path
    let g:branch = trim(system('git -C ' . l:path . ' rev-parse --abbrev-ref HEAD'))
  endif
  
  if v:shell_error != 0 && g:branch != ''
    return ['', 'colorStatusLineGray']
  endif
  
  return ['' . g:branch, 'colorStatusLineBlue']
endfunction

function StatusLineFileStatus()
  return expand('%t') . (&readonly ? ' ' : '') . (&modified ? ' ⚡' : '')
endfunction

function StatusLineFileEncoding()
  return &filetype . ' ' . &fileencoding . ' ' . &fileformat
endfunction

function StatusLineBufferStatus()
  return 'B' . bufnr('$') . ' W' . win_getid()
endfunction

function StatusLineEditorStatus()
  let l:columns = col('.') . '/' . col('$')
  let l:lines = line('.') . '/' . line('$')
  let l:progress = line('.') * 100 / line('$') . '%%'
  return l:columns . ' ' . l:lines . ' ' . l:progress
endfunction

function StatusLineCenter()
  let l:size = winwidth(win_getid())
  let l:used = len(substitute(g:sl, '%#.\{-}#', '', 'g'))
  return repeat(' ', size / 2 - used)
endfunction

function StatusLineCreate()
  let l:separator = 0
  let g:sl = ""

  for l:section in s:sl_sections
    let l:text = ""
    let l:color = ""
    
    if type(l:section[0]) == v:t_func
      let l:result = l:section[0]()
      if type(l:result) == v:t_list
        let l:text = l:result[0]
        let l:color = l:result[1]
      else
        let l:text = l:result
        let l:color = l:section[1]
      endif
    else
      let l:text = l:section[0]
      let l:color = l:section[1]
    endif

    let g:sl .=  '%#' . HiBlend(g:last_color, l:color, l:separator) . '#'

    "      
    if l:separator == 0
      let g:sl .=  ''
    else
      let g:sl .=  ''
    endif

    let g:sl .=  '%#' . l:color . '#'
    let g:sl .= ' ' . l:text . ' '
    let g:last_color = l:color

    if stridx(l:text, '%=') >= 0
      let l:separator = 1
    endif

  endfor

  return g:sl
endfunction

function! TabLineCreate()
  let l:tl = ''
  let l:color = ''
  
  for l:tab in range(1, tabpagenr('$'))
    let l:buffer_list = tabpagebuflist(l:tab)

    if l:tab == tabpagenr()
      let l:color = 'colorTabActive'
    else
      let l:color = 'colorTabInactive'
    endif

    " Tab index
    let l:tl .= '%#' . l:color . '#'
    let l:tl .= ' '. l:tab

    " Buffer modification flag
    let l:modified = ' | '
    for l:buffer in l:buffer_list
      if getbufinfo(l:buffer)[0].changed
        let l:modified = '*| '
        break
      endif
    endfor 
    let l:tl .= l:modified

    " Last active buffer
    let l:active_buffer = l:buffer_list[tabpagewinnr(l:tab) - 1]
    let l:tl .= fnamemodify(bufname(l:active_buffer), ':t')
    let l:tl .= getbufinfo(l:active_buffer)[0].changed ? '* ' : '  '

    " Ending triangle for active tab
    if l:tab == tabpagenr()
      let l:tl .= '%#' . HiBlend('colorTabActive', 'colorTabInactive') . '#'
    endif
  endfor

  return l:tl . '%#colorTabLine#'
endfunction


" [autocmd]

" 
augroup Statusline
  autocmd!
  autocmd WinLeave,BufLeave * setlocal statusline=%f
  autocmd WinEnter,BufEnter * setlocal statusline=%!StatusLineCreate()
  autocmd WinEnter,BufEnter * setlocal tabline=%!TabLineCreate()
augroup END

"
augroup Formatting
  autocmd!
  autocmd BufWritePre *.h,*.hpp,*.c,*.cpp :call FormatBuffer()
augroup END


" Status line

" TODO
let s:sl_sections = [
  \ [function('StatusLineVimMode')],
  \ [function('StatusLineFileStatus'), 'colorStatusLineGreen'],
  \ [function('StatusLineFileEncoding'), 'colorStatusLinePurple'],
  \ [function('StatusLineCenter'), 'colorStatusLineGray'],
  \ [function('StatusLineGitBranch')],
  \ ['%=', 'colorStatusLineRed'],
  \ [function('StatusLineBufferStatus'), 'colorStatusLineCyan'],
  \ [function('StatusLineEditorStatus'), 'colorStatusLineGreen'],
\]
