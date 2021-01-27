syntax on
filetype plugin indent on

set exrc
set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set backupcopy=yes
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set clipboard=unnamedplus

set updatetime=50
set shortmess+=c
set colorcolumn=80

set list
set listchars+=trail:◦



" > Plugins

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'liuchengxu/vim-which-key'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'stsewd/fzf-checkout.vim'
Plug 'mbbill/undotree'
call plug#end()

" > Plugins



" > Colorscheme

colorscheme gruvbox
set background=dark

" < Colorscheme



" > WhichKey


let g:mapleader = "\<Space>"
let g:maplocalleader = ','

call which_key#register('<Space>', "g:which_key_map")

nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

let g:which_key_map =  {}
let g:which_key_map.c = { 'name' : '+coc' }
let g:which_key_map.g = { 'name' : '+git' }

nmap <space>cd <Plug>(coc-definition)
let g:which_key_map.c.d = 'goto definition'

nmap <space>ca <Plug>(coc-codeaction)
let g:which_key_map.c.a = 'code action'

nmap <silent><nowait> <space>cp  :<C-u>CocCommand prettier.formatFile<cr>
let g:which_key_map.c.p = 'prettier'

nmap <space>ch :call CocActionAsync('doHover')<CR>
let g:which_key_map.c.h = 'show help'

nmap <silent><nowait> <space>cg  :<C-u>CocList grep<cr>
let g:which_key_map.c.g = 'grep'

nmap <silent><nowait> <space>cc  :<C-u>CocList commands<cr>
let g:which_key_map.c.c = 'commands'

nmap <silent><nowait> <space>cb  :<C-u>CocList buffers<cr>
let g:which_key_map.c.b = 'buffers'

noremap <space>gs :G<CR>
let g:which_key_map.g.s = 'status'

noremap <space>gb :Git blame<CR>
let g:which_key_map.g.b = 'blame'

noremap <space>gc :GCheckout <CR>
let g:which_key_map.g.c = 'checkout'

noremap <space>gc :GCheckout <CR>
let g:which_key_map.g.cc = 'commit'

noremap <space>gp :Gpull <CR>
let g:which_key_map.g.p = 'pull'

noremap <space>gpu :Gpush <CR>
let g:which_key_map.g.pu = 'push'

nmap <space>n :CocCommand explorer<CR>
let g:which_key_map.n = 'toggle navigation'

nmap <space>u :UndotreeToggle<CR>
let g:which_key_map.u = 'toggle undotree'

noremap <space>s :w<CR>
let g:which_key_map.s = 'save'

noremap <space>S :wa<CR>
let g:which_key_map.S = 'save all'

" > Multiple cursors
hi CocCursorRange guibg=#b16286 guifg=#ebdbb2
nmap <silent> <space>m <Plug>(coc-cursors-word)*
xmap <silent> <space>m y/\V<C-r>=escape(@",'/\')<CR><CR>gN<Plug>(coc-cursors-range)gn
let g:which_key_map.m = 'add cursor for word'
" < Multiple cursors

" < WhichKey


