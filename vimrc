" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim72/vimrc_example.vim or the vim manual
" and configure vim to your own liking!
"Esquema de colores
colorscheme molokai

set colorcolumn=85 "la barrita rojas
set autoindent smartindent "indentacion
filetype plugin on "reconoce archivos
syntax on "Colorea de sintaxis
set number "numeros de linea
set ls=2 "mostrar siempre la barra de status
set showmatch " muestra el matcheo de (){}[]
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set encoding=utf-8
set wildignore=*.o,*~,*.pyc " Ignore compiled filesset wildignore=*.o,*~,*.pyc
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases 
set smartcase
" Highlight search results
"set hlsearch

" Makes search act like search in modern browsers
set incsearch
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autocompletado
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType python set omnifunc=pythoncomplete#Complete

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" With a map leader it's possible to do extra key combinations
" " like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk
"
" " Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?
"
" " Disable highlight when <leader><cr> is pressed
"map <silent> <leader><cr> :noh<cr>
"
" " Smart way to move between windows
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l
""
" " Close the current buffer
map <leader>bd :Bclose<cr>
"
" " Close all the buffers
map <leader>ba :1,1000 bd!<cr>
"
" " Useful mappings for managing tabs
map <leader>tn :tabnext
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <c-t>      :tabnew<cr>
map <leader>tm :tabmove
"
"es el visor de archivos
map <F2> :NERDTreeToggle<CR>
"listado de funciones 
nnoremap <silent> <F9> :TlistToggle<CR>


"lista deiling white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
    %s/\s\+$//ge
      exe "normal `z"
      endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()tags (taglist)

let Tlist_Show_One_File = 1
let Tlist_Auto_Open = 1
let Tlist_Sort_Type = "class"
let Tlist_Exit_OnlyWindow = 1 "if taglist window is the only window left, exit vim
let Tlist_Highlight_Tag_On_BufEnter = 1 "highlight current tag in taglist window

"Mapeo de funciones
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %

""Funciones

"make desde c
map <F3> : call CompileGcc()<CR>
func! CompileGcc()
  "exec "w"
  exec "!gcc % -std=c99 -Wall -g -pedantic -o %.bin"
endfunc

"make y correr
map <F4> : call CompileRunGcc()<CR>
func! CompileRunGcc()
  "exec "w"
  exec "!gcc % -std=c99 -Wall -g -pedantic -o %.bin"
  exec "! ./%.bin"
endfunc
