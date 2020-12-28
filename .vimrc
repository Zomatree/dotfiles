set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'preservim/nerdtree'
Plugin 'joshdick/onedark.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-syntastic/syntastic'
Plugin 'leafOfTree/vim-svelte-plugin'
Plugin 'Yggdroot/indentLine'
Plugin 'frazrepo/vim-rainbow'
Plugin 'airblade/vim-gitgutter'
Plugin 'ryanoasis/vim-devicons'

call vundle#end()
filetype plugin indent on
syntax on
colorscheme onedark


autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <C-b> :NERDTreeToggle<CR>

set number

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


let g:syntastic_python_flake8_args = "--select F402 F406 F407 F5 F6 F7 F8 F9"
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

let g:vim_svelte_plugin_load_full_syntax = 1
:let g:NERDTreeWinSize=22

:set fillchars+=vert:│
hi VertSplit ctermbg=NONE guibg=NONE

set cursorline
let g:indentLine_char = '⎸'

set nowrap
set sidescroll=1

set termguicolors
