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


set autoindent smartindent "indentacion
filetype plugin on "reconoce archivos
syntax on "Colorea de sintaxis
set number "numeros de linea
set nobackup
set ls=2 "mostrar siempre la barra de status
set showmatch " muestra el matcheo de (){}[]

set encoding=utf-8

"MAPEOS
"
map <F2> :NERDTreeToggle<CR>


"lista de tags (taglist)
let Tlist_Show_One_File = 1
let Tlist_Auto_Open = 1
let Tlist_Sort_Type = "class"
nnoremap <silent> <F9> :TlistToggle<CR>
