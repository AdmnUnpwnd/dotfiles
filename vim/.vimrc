set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'


"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'


" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
" YouCompleteMe - An autocompletion plugin
" Bundle 'Valloric/YouCompleteMe'

" Bundle 'Rip-Rip/clang_complete'
" Bundle 'ervandew/supertab'
" Bundle 'Command-T'
" Bundle 'scrooloose/nerdtree'
" Bundle 'scrooloose/syntastic'
" Bundle 'Xuyuanp/nerdtree-git-plugin'
" Bundle 'majutsushi/tagbar'
" Bundle 'dterei/VimBookmarking'
" Bundle 'msanders/snipmate.vim'
" Bundle 'Raimondi/delimitMate'
" Bundle 'tomtom/tcomment_vim'
" Bundle 'Godlygeek/tabular'
" Bundle 'tpope/vim-surround'
" Bundle 'sjl/gundo.vim'
" Bundle 'ervandew/eclim'
" Bundle 'initrc/eclim-vundle'
" Bundle 'Lokaltog/powerline'
" Bundle 'bitc/vim-hdevtools'
" Bundle 'lukerandall/haskellmode-vim'
" Bundle 'eagletmt/neco-ghc'
" Bundle 'gdbmgr'
" Bundle 'Shougo/vimshell.vim'
" Bundle 'osyo-manga/vim-reunions'
" Bundle 'osyo-manga/vim-marching'
" Bundle 'ivalkeen/nerdtree-execute'
" Bundle 'embear/vim-localvimrc'
" Bundle 'synmark.vim'
" Bundle 'mkamensky/VimBrowser'
" Bundle 'vim-scripts/browser.vim'
" Bundle 'jystic/browser.vim"
" Bundle 'zhaocai/linepower.vim'
" Bundle 'zhaocai/GoldenView.Vim'
" Bundle 'majutsushi/tagbar'
" Bundle 'xolox/vim-easytags'
" Bundle 'xolox/vim-misc'
" Bundle 'jdonaldson/vaxe'
" Bundle 'jdonaldson/vim-cheat-x-in-y'
" Bundle 'pelodelfuego/vim-swoop'
" Bundle 'rargo/vim-tab'
" Bundle 'rargo/nerdtree-plugin-collection'
" Bundle 'SirVer/ultisnips'
" Bundle 'tdcdev/ycm_simple_conf'
" Bundle 'yuratomo/dbg.vim'
" Bundle 'yuratomo/w3m.vim'
" Bundle 'yuratomo/gmail.vim'
" Bundle 'edkolev/tmuxline.vim'
" Bundle 'edkolev/promptline.vim'
" Bundle 'mbbill/undotree'
" Bundle 'khorser/vim-repl'
" Bundle 'altercation/vim-colors-solarized'
" Bundle 'benmills/vimux'
" Bundle 'eagletmt/ghcmod-vim'
" Bundle 'eagletmt/ghci-vim'
" Bundle 'eagletmt/neco-ghc'
" Bundle 'tomasr/molokai'
" Bundle 'terryma/vim-multiple-cursors'
" Bundle 'dyng/ctrlsf.vim'
" Bundle 'klen/python-mode'
" Bundle 'wakatime/vim-wakatime'
" Bundle 'mattn/emmet-vim'
" Bundle 'chrisgillis/vim-bootstrap3-snippets'
" Bundle 'mhinz/vim-startify'
" Bundle 'kien/rainbow_parentheses.vim'
" Bundle 'jiangmiao/auto-pairs'


" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'

NeoBundle 'gmarik/Vundle.vim'
NeoBundle 'L9'
" NeoBundle 'git://git.wincent.com/command-t.git'
NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}

NeoBundle 'Shougo/vimproc.vim', {
	\ 'build' : {
	\		'windows' : 'tools\\update-dll-mingw',
	\		'cygwin' : 'make -f make_cygwin.mak',
	\		'mac' : 'make -f make_mac.mak',
	\		'linux' : 'make',
	\		'unix' : 'gmake',
	\	},
	\ }

" NeoBundle 'Rip-Rip/clang_complete'
NeoBundle 'ervandew/supertab'
NeoBundle 'Command-T'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'dterei/VimBookmarking'
NeoBundle 'msanders/snipmate.vim'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'Godlygeek/tabular'
NeoBundle 'tpope/vim-surround'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'lukerandall/haskellmode-vim'
NeoBundle 'eagletmt/neco-ghc'
NeoBundle 'gdbmgr'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/Unite.vim'
NeoBundle 'osyo-manga/vim-reunions'
NeoBundle 'osyo-manga/vim-marching'
NeoBundle 'ivalkeen/nerdtree-execute'
NeoBundle 'embear/vim-localvimrc'
NeoBundle 'synmark.vim'
" NeoBundle 'mkamensky/VimBrowser'
" NeoBundle 'vim-scripts/browser.vim'
NeoBundle 'jystic/browser.vim'
NeoBundle 'zhaocai/linepower.vim'
NeoBundle 'zhaocai/GoldenView.Vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'xolox/vim-easytags'
NeoBundle 'xolox/vim-misc'
NeoBundle 'jdonaldson/vaxe'
NeoBundle 'jdonaldson/vim-cheat-x-in-y'
NeoBundle 'pelodelfuego/vim-swoop'
NeoBundle 'rargo/vim-tab'
NeoBundle 'rargo/nerdtree-plugin-collection'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'Valloric/YouCompleteMe', {'build': {'linux': './install.sh --clang-completer --system-libclang'}}
NeoBundle 'tdcdev/ycm_simple_conf'
NeoBundle 'yuratomo/dbg.vim'
NeoBundle 'yuratomo/w3m.vim'
NeoBundle 'yuratomo/gmail.vim'
NeoBundle 'edkolev/tmuxline.vim'
NeoBundle 'edkolev/promptline.vim'
NeoBundle 'mbbill/undotree'
NeoBundle 'khorser/vim-repl'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'benmills/vimux'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'eagletmt/ghci-vim'
NeoBundle 'eagletmt/neco-ghc'
NeoBundle 'tomasr/molokai'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'dyng/ctrlsf.vim'
NeoBundle 'klen/python-mode'
NeoBundle 'wakatime/vim-wakatime'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'chrisgillis/vim-bootstrap3-snippets'
NeoBundle 'mhinz/vim-startify'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'jiangmiao/auto-pairs'

" NeoBundle 'Lokaltog/powerline'
NeoBundle 'powerline/fonts'
NeoBundle 'bling/vim-airline' "{{{

	set laststatus=2
	let g:airline_powerline_fonts = 1
	let g:airline_theme = 'dark'
	" Stop displaying full paths
	let g:airline#extensions#tabline#fnamemod = ':t'
	
	if !exists('g:airline_symbols')
		let g:airline_symbols = {}
	endif
	
	if has('gui_running')
		let g:airline_left_sep = '»'
		" let g:airline_left_sep = '▶'
		let g:airline_left_sep = ''
		" let g:airline_left_alt_sep='¦'
		let g:airline_left_alt_sep=''
		let g:airline_right_sep = '«'
		" let g:airline_right_sep = '◀'
		let g:airline_right_sep = ''
		" let g:airline_right_alt_sep='¦'
		let g:airline_right_alt_sep=''
		let g:airline_symbols.linenr = '␊'
		let g:airline_symbols.linenr = '␤'
		let g:airline_symbols.linenr = '¶'
		let g:airline_symbols.branch = '⎇'
		let g:airline_symbols.paste = 'ρ'
		let g:airline_symbols.paste = 'Þ'
		let g:airline_symbols.paste = '∥'
		let g:airline_symbols.space = "\ua0"
		let g:airline_symbols.whitespace = 'Ξ'
	else
		let g:airline_left_sep = '»'
		let g:airline_left_sep = '▶'
		let g:airline_left_alt_sep='¦'
		let g:airline_left_alt_sep=''
		let g:airline_right_sep = '«'
		let g:airline_right_sep = '◀'
		let g:airline_right_alt_sep='¦'
		let g:airline_right_alt_sep=''
		let g:airline_symbols.linenr = '␊'
		let g:airline_symbols.linenr = '␤'
		let g:airline_symbols.linenr = '¶'
		let g:airline_symbols.branch = '⎇'
		let g:airline_symbols.paste = 'ρ'
		let g:airline_symbols.paste = 'Þ'
		let g:airline_symbols.paste = '∥'
		let g:airline_symbols.space = "\ua0"
		let g:airline_symbols.whitespace = 'Ξ'
	endif
	
"}}}

if has('lua')
	" NeoBundle 'Shougo/neocomplete.vim'
end

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }


" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

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

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
""""" let g:neocomplete#enable_at_startup = 1
" Use smartcase.
""""" let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
""""" let g:neocomplete#sources#syntax#min_keyword_length = 3
""""" let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
""""" let g:neocomplete#sources#dictionary#dictionaries = {
"""""     \ 'default' : '',
"""""     \ 'vimshell' : $HOME.'/.vimshell_hist',
"""""     \ 'scheme' : $HOME.'/.gosh_completions'
"""""     \ }

" Define keyword.
""""" if !exists('g:neocomplete#keyword_patterns')
"""""     let g:neocomplete#keyword_patterns = {}
""""" endif
""""" let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
""""" inoremap <expr><C-g>     neocomplete#undo_completion()
""""" inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
""""" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
""""" function! s:my_cr_function()
"""""   return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
""""" endfunction
" <TAB>: completion.
""""" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
""""" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
""""" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
""""" inoremap <expr><C-y>  neocomplete#close_popup()
""""" inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
""""" if !exists('g:neocomplete#sources#omni#input_patterns')
"""""   let g:neocomplete#sources#omni#input_patterns = {}
""""" endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
""""" let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


" AdmnUnpwnd Configuration
syntax on				" Turn syntax highlighting on by default

" colorscheme sashaDark
" set background=dark
" let g:solarized_termcolors = 256
" colorscheme solarized
colorscheme molokai

if has('gui_running')
	" set guifont=PragmataPro:size=10:terminesspowerline:size=10
	set guifont=PragmataPro
endif

set ai                  " Set auto-indenting on for programming
set ruler				" Show the current row and column
set number				" Show line numbers
set showcmd				" Display incomplete commands
set autowrite			" Automatically save file when changing buffer
set scrolloff=3         " Keep 3 lines when scrolling

set hlsearch            " Highlight searches
set incsearch           " Do incremental searching
set showmatch           " Jump to matches when entering regexp
set smartcase           " No ignorecase if Uppercase char present
set ignorecase          " Ignore case when searching

set foldmethod=indent   " Fold based on indent
set foldnestmax=10      " Deepest fold is 10 levels
set nofoldenable        " Disable folding by default
set foldlevel=1         " Fold level

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab


let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc','&completefunc']
let g:SuperTabRetainCompletionType=2

inoremap <expr><Enter>  pumvisible() ? "\<C-Y>" : "\<Enter>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" For Navigating Split Windows
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" Enable delimitMate
let delimitMate_expand_cr = 1

" For vim-swoop
" Swoop Current Buffer
noremap <Leader>gc :call SwoopCurrentBuffer()
" Swoop All Buffers
noremap <Leader>gg :call SwoopAllBuffer()
" Swoop Matching Buffers
noremap <Leader>gb :call SwoopMatchingBuffer()

" For vim-tab
autocmd BufEnter *.[ch] call TabReloadCGtag()
autocmd BufEnter *.cpp call TabReloadCGtag()
autocmd BufEnter *.java call TabReloadCGtag()
"reload GTAGS, ctags.
function! TabReloadCGtag()
	"reload GTAGS in current directory
	cs kill 0
	"gnu global produce GTAGS, more useful than cscope
	cs add GTAGS
	"reload tags in current directory
	set tags=tags
endfunction

"some action when enter a tab
function! TabEnterTag(nr)
	"echo "tab ". a:nr . " enter"
	call TabReloadCGtag()
endfunction

"some action when leave a tab
function! TabLeaveTag(nr)
	"echo "tab ". a:nr . " leaves"
	"nothing
endfunction

let g:TabTagTrigger = {'name':'TabTagTriger','pattern':"pattern", 'enter_callback':"TabEnterTag", 'leave_callback':"TabLeaveTag" }

"call tab#TabShowTrigger()
call tab#TabAddTrigger(g:TabTagTrigger)

" For ultisnips
" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" For tmuxline.vim
let g:airline#extensions#tmuxline#enabled = 1
let g:tmuxline_powerline_separators = 1

" For promptline.vim
let g:promptline_powerline_symbols = 1
" sections (a, b, c, x, y, z, warn) are optional
let g:promptline_preset = {
        \'a' : [ promptline#slices#host() ],
        \'b' : [ promptline#slices#user() ],
        \'c' : [ promptline#slices#cwd() ],
        \'y' : [ promptline#slices#vcs_branch() ],
        \'warn' : [ promptline#slices#last_exit_code() ]}

" available slices:
"
" promptline#slices#cwd() - current dir, truncated to 3 dirs. To configure: promptline#slices#cwd({ 'dir_limit': 4 })
" promptline#slices#vcs_branch() - branch name only. By default, only git branch is enabled. Use promptline#slices#vcs_branch({ 'hg': 1, 'svn': 1, 'fossil': 1}) to enable check for svn, mercurial and fossil branches. Note that always checking if inside a branch slows down the prompt
" promptline#slices#last_exit_code() - display exit code of last command if not zero
" promptline#slices#jobs() - display number of shell jobs if more than zero
" promptline#slices#battery() - display battery percentage (on OSX and linux) only if below 10%. Configure the threshold with promptline#slices#battery({ 'threshold': 25 })
" promptline#slices#host()
" promptline#slices#user()
" promptline#slices#python_virtualenv() - display which virtual env is active (empty is none)
" promptline#slices#git_status() - count of commits ahead/behind upstream, count of modified/added/unmerged files, symbol for clean branch and symbol for existing untraced files
"
" any command can be used in a slice, for example to print the output of whoami in section 'b':
"       \'b' : [ '$(whoami)'],
"
" more than one slice can be placed in a section, e.g. print both host and user in section 'a':
"       \'a': [ promptline#slices#host(), promptline#slices#user() ],
"
" to disable powerline symbols
" `let g:promptline_powerline_symbols = 0`

" For undotree
if has("persistent_undo")
    set undodir='~/.undodir/'
    set undofile
endif

" For Haskell
let g:haddock_browser="/opt/google/chrome/google-chrome"
let g:haddock_docdir="/usr/share/doc/ghc/html/"
let g:ycm_semantic_triggers = {'haskell' : ['.']}
let g:necoghc_enable_detailed_browse = 1

" For Multiple Cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-s>'
let g:multi_cursor_prev_key='<C-a>'
let g:multi_cursor_skip_key='<C-d>'
let g:multi_cursor_quit_key='<Esc>'

" For Rainbow Parenthesis
au VimEnter * RainbowParenthesesToggle     " Toggle it on/off
au Syntax * RainbowParenthesesLoadRound    " (), the default when toggling
au Syntax * RainbowParenthesesLoadSquare   " []
au Syntax * RainbowParenthesesLoadBraces   " {}
au Syntax * RainbowParenthesesLoadChevrons " <>

