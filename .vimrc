set nocompatible              " be iMproved, required
filetype off                  " required

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
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'Valloric/YouCompleteMe'
Plugin 'mhinz/vim-startify'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'morhetz/gruvbox'
Plugin 'elmcast/elm-vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'jwalton512/vim-blade'
Plugin 'MattesGroeger/vim-bookmarks'
Bundle 'zhaocai/GoldenView.Vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"leader key
let mapleader = " "

"Esc
inoremap <S-Space> <ESC>

"YCM
let g:ycm_server_python_interpreter = "/usr/bin/python"

"line numbers
set number

"matchit
set nocompatible
filetype plugin on
runtime macros/matchit.vim
let b:match_debug = 1

"4 space tab
set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4

"colorScheme
syntax enable
set t_Co=256
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark = 'hard'

" Open nerdtree if no file specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | "endif

"NerdTreeHotkey
map <C-e> :NERDTreeToggle<CR>
" nmap <silent> <Leader>[ :call g:WorkaroundNERDTreeToggle()<CR>
"
"function! g:WorkaroundNERDTreeToggle()
" try | NERDTreeToggle | catch | silent! NERDTree | endtry
" endfunction

"tagbarHotkey
nnoremap <silent> <Leader>p :TagbarToggle<CR>

"splits remap
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"split opening
set splitbelow
set splitright

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('py', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('pyc', 'Magenta', 'none', '#ff00ff', '#151515')

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"AirLine
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing', 'long']

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

"GoldenVIew
let g:goldenview__enable_default_mapping = 0

" 1. split to tiled windows
nmap <silent> <Leader>w= <Plug>GoldenViewSplit

" 2. quickly switch current window with the main pane
" and toggle back
nmap <silent> <Leader>[   <Plug>GoldenViewSwitchMain
nmap <silent> <Leader>[[  <Plug>GoldenViewSwitchToggle

" 3. jump to next and previous window
nmap <silent> <Leader>N  <Plug>GoldenViewNext
nmap <silent> <Leader>P  <Plug>GoldenViewPrevious

"Path constants
let $s='~/.vim/session/'
let $rc='~/.vimrc'

"elmcast
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:elm_syntastic_show_warnings = 1

let g:ycm_semantic_triggers = {
     \ 'elm' : ['.'],
     \}

let g:elm_jump_to_error = 0
let g:elm_make_output_file = "elm.js"
let g:elm_make_show_warnings = 0
let g:elm_syntastic_show_warnings = 0
let g:elm_browser_command = ""
let g:elm_detailed_complete = 0
let g:elm_format_autosave = 0
let g:elm_classic_hightlighting = 0
let g:elm_setup_keybindings = 0


"Calls `elm make` for the current file
"Calls `elm make` with Main.elm
"Calls `elm test` with Test[filename].elm
"Calls `elm repl` in a subprocess
"Shows the detail of the current error.
"Queries `elm oracle` and shows the docs for the word under the cursor.
"Queries `elm oracle` and browses the docs for the word under the cursor.

nmap <silent> <Leader>me  <Plug>(elm-make)
nmap <silent> <Leader>ma  <Plug>(elm-make-main)
nmap <silent> <Leader>er  <Plug>(elm-repl)
nmap <silent> <Leader>rr  <Plug>(elm-error-detail)
nmap <silent> <Leader>bd  <Plug>(elm-browse-docs)
nmap <silent> <Leader>br  <Plug>(elm-show-docs)

"bookmark Autoclose
let g:bookmark_auto_close = 1
nmap <Leader><Leader>m <Plug>BookmarkToggle
nmap <Leader>i <Plug>BookmarkAnnotate
nmap <Leader>a <Plug>BookmarkShowAll
nmap <Leader>j <Plug>BookmarkNext
nmap <Leader>k <Plug>BookmarkPrev
nmap <Leader>c <Plug>BookmarkClear
nmap <Leader>x <Plug>BookmarkClearAll
nmap <Leader>kk <Plug>BookmarkMoveUp
nmap <Leader>jj <Plug>BookmarkMoveDown

let g:bookmark_no_default_key_mappings = 1

