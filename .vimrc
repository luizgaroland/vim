filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" Git plugin not hosted on GitHub
"Essential
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-surround'
Plugin 'wellle/targets.vim'
Plugin 'zhaocai/GoldenView.Vim'
Plugin 'mhinz/vim-startify'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'tpope/vim-repeat'
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/vim-auto-save'
Plugin 'Yggdroot/indentLine'
Plugin 'ajh17/VimCompletesMe.git'
Plugin 'maralla/completor.vim'
Plugin 'sheerun/vim-polyglot'
"Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'majutsushi/tagbar'
"Plugin 'ludovicchabant/vim-gutentags'

"Snippets
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'

"HTML
"Plugin 'mattn/emmet-vim'
"Plugin 'alvan/vim-closetag'

"Stylus
Plugin 'wavded/vim-stylus'

"GIT
"Plugin 'tpope/vim-fugitive'

"CSS
Plugin 'hail2u/vim-css3-syntax'

"PHP
"Plugin 'shawncplus/phpcomplete.vim'

"PYTHON
"Plugin 'klen/python-mode.git'
"Plugin 'kana/vim-textobj-user'
"Plugin 'kana/vim-textobj-indent'

"JAVASCRIPT
"Plugin 'ternjs/tern_for_vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"leader key
let mapleader = " "

"line numbers
set number
set cc=80

"Tweaks
syntax sync maxlines=70
set synmaxcol=800
set relativenumber

"matchit
set nocompatible
filetype plugin on
runtime macros/matchit.vim

"if Gvim
if has("gui_running")
    set guioptions -=T
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    set guiheadroom=0
    set guioptions-=e
endif

"Nvim options
if has('nvim')
    "nvim terminal mode exit
    tnoremap <Esc> <C-\><C-n>

    "Remove hl search
    set nohlsearch
endif

"4 space tab
set tabstop=4 softtabstop=0 shiftwidth=4 expandtab

"colorScheme
set background=dark
colorscheme gruvbox
syntax enable
set guifont=Monaco\ 13

if &term =~ '256color'
    " disable Background Color Erase (BCE)
    set t_ut=
endif

"splits remap
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"split opening
set splitbelow
set splitright

" Setup some default ignores
"let g:ctrlp_custom_ignore = {
            "\ 'dir':  '\v[\/](\.(git|hg|svn)|\_site|node_modules)$',
            "\ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
            "\}

"" Use the nearest .git directory as the cwd
"" This makes a lot of sense if you are working on a project that is in version
"" control. It also supports works with .svn, .hg, .bzr.
"let g:ctrlp_working_path_mode = 'r'

"Startfy config
autocmd User Startified setlocal cursorline
let g:startify_bookmarks = [ {'v': '~/.vimrc'} ]
let g:startify_session_autoload = 1

let g:startify_list_order = [
            \ ['   LRU:'],
            \ 'files',
            \ ['   LRU within this dir:'],
            \ 'dir',
            \ ['   Sessions:'],
            \ 'sessions',
            \ ['   Bookmarks:'],
            \ 'bookmarks',
            \ ]

"GoldenView
let g:goldenview__enable_default_mapping = 0

" 1. split to tiled windows
nmap <silent> <Leader>w= <Plug>GoldenViewSplit

" 2. quickly switch current window with the main pane
" and toggle back
nmap <silent> <Leader>[   <Plug>GoldenViewSwitchMain
nmap <silent> <Leader>[[  <Plug>GoldenViewSwitchToggle

"Path constants
let $s='~/.vim/session/'
let $rc='~/.vimrc'

"Fugitive
"rebind my favorite commands from Git.vim for Fugitive
nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>gp :Gpush<cr>
nmap <leader>gP :Gpull<cr>

"autoclosetags
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.blade.php"

"search selected
vnoremap // y/<C-R>"<CR>

"Completion
set completeopt=menu

"UtilSnips
"let g:UltiSnipsExpandTrigger="<S-tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
"" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

"Move Macro
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

"Better j and k
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

"Increment Column number
fu! Incr()
    let a = line('.') - line("'<")
    let c = virtcol("'<")
    if a > 0
        execute 'normal! '.c.'|'.a."\<C-a>"
    endif
    normal `<
endfu

vnoremap <C-a> :call Incr()<CR>

"gutentags
let g:gutentags_ctags_executable = 'ctags'
let g:gutentags_ctags_exclude = ['*.json', '*.xml',
            \  '*.ini', '*.rst', '*.md',
            \ '*var/cache*', '*var/log*', ]

"TagBar
nmap <Leader>m :TagbarToggle<CR>

"completion options PHP
"let g:phpcomplete_parse_docblock_comments = 1
"let g:phpcomplete_enhance_jump_to_definition = 1

"ident Guide
set list lcs=tab:\*\

"Tern path to completor
let g:completor_node_binary = '~/bin/tern/node_modules/tern/bin/tern'
let g:completor_refresh_always = 0

"fzf
"If installed using git
set rtp+=~/.fzf

nmap <C-p> :Files<CR>


"Macros
let @a = 'csW"W.W.W.W.W.W.W.W.W.^'
let @s = 'ElxElxElxElxElxElxElxElxElx^'
let @d = 'V:s/\"\"/\", \"/g'
let @f = '[A]^Vypppppkkkkk'
let @g = 'jjjj$A,i[5jA]5k^'
let @h = 'EEEEEdt]jE.jE.jE.jE.4k^'
let @j = 'jlveElxjveElElxjveEEElxjveEEEElxjveEEEEElx5k^'
let @k = "^^i'5jA'^5k"
let @l = 'JJJJJ^'
let @z = '@a@s@d@f@g@h@j@k@l'
