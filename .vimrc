" VIMRC

" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'powerline/fonts'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'
" Plugin 'valloric/youcompleteme'

call vundle#end()            " required
filetype plugin indent on    " required

" Plugin Settings

" Airline
set laststatus=2
set encoding=utf-8
let g:airline_powerline_fonts = 1
let g:airline_theme='quantum'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler = 'gcc++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'

" NERDTree
autocmd VimEnter * NERDTree
autocmd VimEnter * if argc() | wincmd p | endif
let NERDTreeShowHidden = 1
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

" Editing
set hidden				" Hides buffers
set number				" Enable line numbers
set ruler					" Turn on the ruler
set showmatch			" Show matching parenthesis
set lazyredraw		" Don't update the display while executing macros
set showcmd				" Show command
set mouse=a				" Enable mouse if terminal allows
set scrolloff=5		" Keep lines off the edge of the screen
set nowrap				" Don't wrap lines
syntax on					" Syntax highlighting
set autoread			" Auto reload files changed outside of Vim

" Colors
set background=dark
colorscheme quantum

" Tabs
set autoindent		" Always set autoindent
set copyindent		" Copy the previous indentation on autoindenting
set tabstop=2			" Tabs are 2 spaces
set shiftwidth=2	" Number of spaces used for autoindenting
set shiftround		" Use multiple of shiftwidth when indenting wit '<' and '>'
set smarttab			" Insert tabs on the start of a line according to shiftwidth not tabstop

" Searching
set ignorecase		" Ignore case when searching
set smartcase			" Ignore case if search pattern is all lowercase, case-sensitive otherwise
set incsearch			" Show search matches as you type
set hlsearch			" Highlight search terms



