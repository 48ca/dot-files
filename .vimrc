set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'lepture/vim-jinja'
Plugin 'bronson/vim-trailing-whitespace'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on
filetype on
set number
set tabstop=4
set expandtab
set shiftwidth=4
colorscheme elflord
" colorscheme darkblue
au BufNewFile,BufRead *.ejs set filetype=html
set noautoindent

" Airline
set laststatus=2
" let g:airline_theme='wombat'
let g:airline_powerline_fonts = 0
set t_Co=256
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#branch#vcs_priority = ["git", "mercurial"]
let g:airline_left_sep=""
let g:airline_right_sep=""
" set guifont=Inconsolata\ for\ Powerline

execute pathogen#infect()

" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif
