" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on

" Basic Settings {
    set nocompatible

    " Lots of History
    set history=1000

    " Set to light to get good syntax highlighting
    set background=light

    " Allow backspacing over everything in insert mode
    set backspace=2

    " Set up cpoptions
    set cpoptions=aABceFsmq
    "             ||||||||+-- Leave the cursor between joined lines
    "             |||||||+-- Pause when new match is created
    "             ||||||+-- Set options upon entering a buffer
    "             |||||+-- :write updates the current file name
    "             ||||+-- Automatically add <CR> to registers
    "             |||+-- Search continues at the end of the current match
    "             ||+-- Backslashes have no special meaning for :map
    "             |+-- :write sets alternative file name
    "             +-- :read sets alternative file name

    " Always turn on modeline support
    set modeline
    
    if has("autocmd")
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    endif
" }

" Behavior {
    " Load filetype indenation and plugins (python-mode requires)
    filetype plugin indent on

    "Always create backup files
    set backup

    " Backup and swap files will live in $HOME/.vim{backup,tmp}
    set backupdir=/tmp/
    "set directory=~/.vim/tmp

    " Alias the * register to the system's clipboard
    set clipboard=unnamedplus

    " Support all three formats (<CR>, <CR><LF>, and <LF><CR>) in that order
    set fileformats=unix,dos,mac

    " Be quiet
    set noerrorbells

    " Turn auto-indentation on, but be smart about it
    set autoindent
    set smartindent

    set clipboard=unnamed
" }

" UI {
    " Set colorscheme
    " https://github.com/flazz/vim-colorschemes
    colorscheme monokain

    " Use solarized: https://github.com/altercation/vim-colors-solarized
    " make sure to set iterm2 -> profiles -> Terminal -> Type ->
    " xterm-256color
    "syntax enable
    "set background=dark
    "colorscheme solarized

    " Incremental search, highlight matches
    set hlsearch
    set incsearch

    " Always show the ruler
    set ruler

    " Avoid redrawing when possible
    set lazyredraw

    " Show matching brackets, blink them for 0.2 seconds
    set noshowmatch
    set matchtime=0

    " Don't jump to the first non-whitespace on a line
    set nostartofline

    " Report when anything is changed via :commands
    set report=0

    " Short status messages
    set shortmess=aOstT

    " Always show the command being typed
    set showcmd

    " Scroll when 5 characters from the edge
    set scrolloff=5
    set sidescrolloff=5

    " Set auto-complete to offer the longest possible match
    set completeopt=longest,menuone

    " Highlight column 80 to warn about long lines
    "set colorcolumn=80

    " Searches are case insensitive
    set ignorecase
" }

" Text Formatting/Layout {
    " Use UTF-8
    set encoding=utf-8

    " Automatically start comments, gq formats comments
    set formatoptions=q

    " Don't wrap lines
    set nowrap

    " Contextually be case-sensitive
    set smartcase

    " By default, real tabs should be 8 characters wide
    set tabstop=8

    " Use Spaces, not tabs
    set expandtab
" }

" Folding {
    " Turn folding on by default
    " set foldenable
    "
    " Folding should be done by syntax generally
    " set foldmethod=syntax
    "
    " By default, let's fold everything but the top level
    " set foldlevel=1
    "
    " By default, everything can open a fold except vertical movement
    " set foldopen=block,hor,insert,jump,mark,percent,search,tag,undo,quickfix
" }

" Filetype settings {
    autocmd BufRead,BufNewFile *.sls set ft=yaml

    autocmd BufWritePost * %s/\s\+$//e

    "autocmd Filetype c,cpp    set shiftwidth=4 tabstop=4 foldlevel=0
    "autocmd Filetype erlang   set shiftwidth=4 tabstop=4
    "autocmd Filetype html,xml set shiftwidth=1 tabstop=1
    "autocmd Filetype python   set shiftwidth=4 tabstop=4
    "autocmd Filetype rst      set shiftwidth=4 tabstop=4
    "autocmd Filetype ruby     set shiftwidth=2 tabstop=2
    autocmd Filetype yaml     set shiftwidth=2 tabstop=2
    autocmd Filetype zsh      set shiftwidth=2 tabstop=2
" }

" python-mode {
    " https://github.com/klen/python-mode
"    let g:pymode_folding = 0
"    let g:pymode_lint_checkers = []
"    let g:pymode_lint_ignore = "E128,E201,E202,E251,E501"
"    autocmd FileType python setlocal nonumber
"    let g:pymode_rope = 0
" }
"
" vim-airline {
" https://github.com/bling/vim-airline
"    let g:airline#extensions#tabline#enabled = 1
"    if !exists('g:airline_symbols')
"              let g:airline_symbols = {}
"      endif
"    let g:airline_symbols.space = "\ua0"
" }
"
" syntastic {
"    set statusline+=%#warningmsg#
"    set statusline+=%{SyntasticStatuslineFlag()}
"    set statusline+=%*
"    
"    let g:syntastic_always_populate_loc_list = 1
"    let g:syntastic_auto_loc_list = 1
"    let g:syntastic_check_on_open = 1
"    let g:syntastic_check_on_wq = 0
"}

" tagbar
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
