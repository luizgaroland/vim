let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
"Configuration
Plug 'morhetz/gruvbox'
"Plug 'zhaocai/GoldenView.Vim'
Plug 'mhinz/vim-startify'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'vim-scripts/vim-auto-save'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
"Plug 'stevearc/oil.nvim'


Plug 'tpope/vim-dotenv'
"Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim'
"Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
"Plug 'MunifTanjim/nui.nvim'
"Plug 'nvimtools/none-ls.nvim'


"Movement and text Objects
Plug 'yangmillstheory/vim-snipe'
Plug 'wellle/targets.vim'
Plug 'machakann/vim-sandwich'
Plug 'michaeljsmith/vim-indent-object'

"Languagues
"Plug 'leafgarland/typescript-vim'
"Plug 'sheerun/vim-polyglot'
"Plug 'iloginow/vim-stylus' Plug 'hail2u/vim-css3-syntax' Plug 'elixir-editors/vim-elixir'
Plug 'brett-griffin/phpdocblocks.vim'

"Auto complete
"Plug 'vim-scripts/VimCompletesMe'
"Plug 'wellle/tmux-complete.vim'
"
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Linting
"Plug 'w0rp/ale'
"AI
Plug 'github/copilot.vim'
call plug#end()

filetype plugin indent on

"leader key
let mapleader = " "

"line numbers
set number
set cc=80

"Tweaks
syntax sync maxlines=70
set synmaxcol=1500
"set relativenumber

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
let g:gruvbox_contrast_dark='medium'
colorscheme gruvbox
syntax enable

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
nmap <silent> <Leader>w= <Plug>GoldenViewSplit
nmap <silent> <Leader>[   <Plug>GoldenViewSwitchMain
nmap <silent> <Leader>[[  <Plug>GoldenViewSwitchToggle

"Path constants
let $s='~/.vim/session/'
let $rc='~/.vimrc'

"search selected
vnoremap // y/<C-R>"<CR>

"Move Macro
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

"Better j and k
noremap <expr> k (v:count ? 'k' : 'gk')
noremap <expr> j (v:count ? 'j' : 'gj')

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

"ident Guide
set list lcs=tab:\*\

" Find files
noremap <C-p> :Files<CR>

"Vim-snipe
map <leader><leader>F <Plug>(snipe-F)
map <leader><leader>f <Plug>(snipe-f)
map <leader><leader>T <Plug>(snipe-T)
map <leader><leader>t <Plug>(snipe-t)
map <leader><leader>w <Plug>(snipe-w)
map <leader><leader>W <Plug>(snipe-W)
map <leader><leader>e <Plug>(snipe-e)
map <leader><leader>E <Plug>(snipe-E)
map <leader><leader>b <Plug>(snipe-b)
map <leader><leader>B <Plug>(snipe-B)
map <leader><leader>w <Plug>(snipe-w)
map <leader><leader>W <Plug>(snipe-W)
map <leader><leader>e <Plug>(snipe-e)
map <leader><leader>E <Plug>(snipe-E)
map <leader><leader>b <Plug>(snipe-b)
map <leader><leader>B <Plug>(snipe-B)
nmap <leader><leader>x <Plug>(snipe-f-x)
nmap <leader><leader>r <Plug>(snipe-f-r)
nmap <leader><leader>R <Plug>(snipe-F-r)
nmap <leader><leader>X <Plug>(snipe-F-x)

let g:snipe_jump_tokens = 'asdfghjkl'

"Change path to current file
noremap <Leader><Leader>cp :cd %:p:h<CR>

noremap <Leader><Leader>p :NvimTreeOpen<CR>
noremap <Leader><Leader>d :PHPDocBlocks<CR>

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

inoremap <silent><script><expr> <C-d> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

lua << EOF
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.opt.termguicolors = true

    require("nvim-tree").setup()
EOF

