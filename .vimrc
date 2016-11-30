set nocompatible " be iMproved, required
filetype off " required

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
Plugin 'Valloric/YouCompleteMe'
Plugin 'mhinz/vim-startify'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'morhetz/gruvbox'
Plugin 'elmcast/elm-vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'jwalton512/vim-blade'
Plugin 'alvan/vim-closetag'
Plugin 'klen/python-mode.git'
Plugin 'vim-scripts/vim-auto-save'
Plugin 'tpope/vim-fugitive'
Plugin 'myusuf3/numbers.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jiangmiao/auto-pairs'
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

"line numbers
set number
set cc=80

"matchit
set nocompatible
filetype plugin on
runtime macros/matchit.vim
let b:match_debug = 1

"No menu bar gvim
if has("gui_running")
	set guifont=Monaco:h13
	set guioptions -=m
	set guioptions -=T
	set guioptions-=r  "remove right-hand scroll bar
	set guioptions-=L  "remove left-hand scroll bar
endif

"4 space tab
set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4

"colorScheme
syntax enable
set t_Co=256
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
set background=dark

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

"YouCompleteme
let g:ycm_autoclose_preview_window_after_completion = 1
" Setup some default ignores
let g:ctrlp_custom_ignore = {
			\ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
			\ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
			\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

"""syntastic
""set statusline+=%#warningmsg#
""set statusline+=%{SyntasticStatuslineFlag()}
""set statusline+=%*
""
""let g:syntastic_always_populate_loc_list = 1
""let g:syntastic_auto_loc_list = 1
""let g:syntastic_check_on_open = 1
""let g:syntastic_check_on_wq = 0

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

"""elmcast
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:elm_syntastic_show_warnings = 1
"
"let g:ycm_semantic_triggers = {
"			\ 'elm' : ['.'],
"			\}
"
"let g:elm_jump_to_error = 0
"let g:elm_make_output_file = "elm.js"
"let g:elm_make_show_warnings = 0
"let g:elm_syntastic_show_warnings = 0
"let g:elm_browser_command = ""
"let g:elm_detailed_complete = 0
"let g:elm_format_autosave = 0
"let g:elm_classic_hightlighting = 0
"let g:elm_setup_keybindings = 0

"Calls `elm make` for the current file
"Calls `elm make` with Main.elm
"Calls `elm test` with Test[filename].elm
"Calls `elm repl` in a subprocess
"Shows the detail of the current error.
"Queries `elm oracle` and shows the docs for the word under the cursor.
"Queries `elm oracle` and browses the docs for the word under the cursor.

"nmap <silent> <Leader>me  <Plug>(elm-make)
"nmap <silent> <Leader>ma  <Plug>(elm-make-main)
"nmap <silent> <Leader>er  <Plug>(elm-repl)
"nmap <silent> <Leader>rr  <Plug>(elm-error-detail)
"nmap <silent> <Leader>bd  <Plug>(elm-browse-docs)
"nmap <silent> <Leader>br  <Plug>(elm-show-docs)

"Fugitive
"rebind my favorite commands from Git.vim for Fugitive
nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>gp :Gpush<cr>
nmap <leader>gP :Gpull<cr>

"PhpComplete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

"autoclosetags
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.blade.php"

"Folding automatic
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
