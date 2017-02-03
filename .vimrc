set nocompatible              " be iMproved, required

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'mhinz/vim-startify'
Plugin 'jlanzarotta/bufexplorer'

call vundle#end()            " required
filetype plugin indent on    " required

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" these are the file browser settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15
augroup ProjectDrawer
    autocmd!
    autocmd VimEnter * :Vexplore
    au VimEnter * wincmd l
augroup END

"the following lines make startify show up in new buffers
autocmd VimEnter * autocmd WinEnter * let w:created=1
autocmd VimEnter * let w:created=1
autocmd WinEnter * if !exists('w:created') && !(&ft ==# 'netrw') | :Startify | endif

if has("vms")
    set nobackup		" do not keep a backup file, use versions instead
else
    set backup		" keep a backup file
endif

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
syntax on
set hlsearch

set nowrap
set softtabstop=4
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab  
set autoindent
set number

filetype on
filetype plugin indent on

"intelligently autocomplete on tab
function TabOrComplete()
    let col = col('.')-1
    if !col || getline('.')[col-1] !~ '\k'
        return "\<tab>"
    else
        return "\<C-N>"
    endif
endfunction

inoremap <Tab> <C-R>=TabOrComplete()<CR>
inoremap <Nul> <C-X><C-o>

"prevent splits from resizing other windows
set noequalalways 

"make mouse work
set mouse=a

colorscheme desert
