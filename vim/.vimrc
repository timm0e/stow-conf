" Max's custom .vimrc
" Load defaults
set nocompatible
set encoding=utf-8

unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'FredKSchott/CoVim'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on

" Max's Customisations
set number
set nofixendofline
set tabstop=4 " Make tabs appear 4 spaces wide

set expandtab " Convert tabs to spaces
set shiftwidth=4 " Indent width for spaces (but same as tabstop)

autocmd FileType c setlocal noexpandtab
autocmd FileType html setlocal shiftwidth=2
autocmd FileType json setlocal shiftwidth=2
autocmd FileType yaml setlocal shiftwidth=2

colorscheme desert
