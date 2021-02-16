set nocompatible
filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'joshdick/onedark.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-syntastic/syntastic'
Plugin 'leafOfTree/vim-svelte-plugin'
Plugin 'Yggdroot/indentLine'
Plugin 'frazrepo/vim-rainbow'
Plugin 'airblade/vim-gitgutter'
Plugin 'ryanoasis/vim-devicons'
Plugin 'jparise/vim-graphql'
Plugin 'cespare/vim-toml'
Plugin 'mhinz/vim-startify'
Plugin 'ms-jpq/chadtree'
Plugin 'romgrk/barbar.nvim'
Plugin 'kyazdani42/nvim-web-devicons'
Plugin 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plugin 'neoclide/coc.nvim', {'branch': 'release'}

call vundle#end()

filetype plugin indent on
syntax on
colorscheme onedark

autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd StdinReadPre * let s:std_in=1

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_python_flake8_args = "--ignore=C901,E305,E501,W292,W391,W505,E302,W293,F901"
let g:chadtree_settings = {"ignore.name_exact": [".git", "__pycache__"], "view.width": 22}
let g:vim_svelte_plugin_load_full_syntax = 1
let g:indentLine_char = '⎸'

hi FloatermBorder guibg=#2c323c guifg=white
hi VertSplit ctermbg=NONE guibg=NONE

set number
set statusline+=W%{winnr()}
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set cursorline
set fillchars+=vert:│
set nowrap
set sidescroll=1
set termguicolors
set ignorecase
set smartcase
set wildignore+=*/__pycache__/*,*.pyc
set noswapfile
set mouse=a
set wildmenu
set wildmode=list:longest,full
set hidden
set nobackup
set cmdheight=2
set updatetime=100
set shortmess+=c

if has("patch-8.1.1564")
    set signcolumn=number
else
    set signcolumn=yes
endif

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
      let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

map <C-BS> <C-W>
map <C-b> :CHADopen<CR>


lua << EOF 
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
    highlight = {
        enable = true
    },
}

EOF 
