syntax on
set cursorline

" set mouse=a

filetype off

set autoread
set autowrite
set laststatus=2

set backspace=2 "Make backspace work as expected on Mac OS X
set autoindent  "Auto Indent code - This simply retains indentation level

" Showing whitespace
set list listchars=tab:\ \ ,trail:·

" General indentation settings

" Note that these vary from language to language
set tabstop=2   "Set space width of tabs
set softtabstop=2
set sw=2
set expandtab

set splitright  "By default, split to the right
set splitbelow
set number      "Add line numbers
set ruler       "Display Cursor Position
set title       "Display filename in titlebar
set titleold=   "Prevent the "Thanks for flying Vim"
set nohlsearch

set incsearch   "Display search resultings as you type
set ignorecase
set smartcase
set wildmenu

set textwidth=80
set formatoptions=tcroqnl1

" Mark the 81st column
if exists('+colorcolumn')
  set colorcolumn=+1
endif

filetype plugin on
filetype indent off

let mapleader=","
let maplocalleader=","

" Round indentation to multiple of shiftwidth
set shiftround

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

set statusline=%f    " Path.
set statusline+=%m   " Modified flag.
set statusline+=%r   " Readonly flag.
set statusline+=%w   " Preview window flag.

set statusline+=\    " Space.

set statusline+=%#redbar#                " Highlight the following as a warning.
set statusline+=%*                           " Reset highlighting.

set statusline+=%=   " Right align.

" File format, encoding and type.  Ex: "(unix/utf-8/python)"
set statusline+=(
set statusline+=%{&ft}                        " Type (python).
set statusline+=)

" Line and column position and counts.
set statusline+=\ (L%l\/%L,\ C%03c)

" Don't move on *, but turn on hlsearch
nnoremap * :set hlsearch<CR>*<c-o>

" Toggle hlsearch
nnoremap <Leader>h :set hlsearch!<CR>

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L g_

" let [jk] go down and up by display lines instead of real lines. Let g[jk]
" do what [jk] normally does
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

" Git Grep
nnoremap <Leader>gg :GitGrep<space>
vnoremap <Leader>gg "gy:GitGrep <C-R>g<CR>

" Sort
" Select a block of text in visual mode then hit ,s
vnoremap <Leader>s :!sort<CR>

"Map Semicolon to : for faster command execution
nmap ; :

"Zoom
nnoremap <Leader>z :ZoomWin<CR>

"] and ^] switch between tabs
nmap ] :tabNext<CR>

"\ and | switch between split screens
nmap \ <C-w><C-w>
nmap \| <C-w>W

"NERDTree
map <Leader>n :NERDTreeToggle<CR>

"Gundo
nmap <Leader>u :GundoToggle<CR>

"Make
nmap <Leader>m :make<CR>

",p copies the current filepath
nmap <Leader>p :!echo `pwd`/% \| pbcopy<CR><CR>

" Tabularize
vmap <Leader>t :Tabularize /

" CtrlP
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_clear_cache_on_exit = 1
nnoremap <leader>b :CtrlPBuffer<CR>
set wildignore+=*.o,.git,*.jpg,*.png,*.swp,*.d,*.gif,*.pyc,node_modules

" OmniCompletion
set completeopt=longest,menuone
set omnifunc=syntaxcomplete#Complete
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" Search for selected text, forwards or backwards.
" http://vim.wikia.com/wiki/Search_for_visually_selected_text
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" GUI Options
if has("gui_running")
  set guioptions=egt
endif

"LANGUAGE SPECIFIC COMMANDS
"
" For all languages:
"  <Leader>c - Syntax Check / Compile
"  <Leader>r - Execute
"
" See ftplugin/*.vim

autocmd BufNewFile,BufRead *.json set ft=json
