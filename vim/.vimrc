colorscheme habamax 


call plug#begin('~/.config/vim/plugins')
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/fzf'
  Plug 'tpope/vim-surround'
  Plug 'PotatoesMaster/i3-vim-syntax'
  Plug 'jreybert/vimagit'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'neoclide/coc.nvim'
  Plug 'tomtom/tcomment_vim'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'rust-lang/rust.vim'
call plug#end()


" coc config ===========
let g:rustfmt_autosave = 1
let g:coc_snippet_next = '<tab>'
let g:coc_node_path = '/usr/local/bin/node'
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
" coc config ===========



" buffers and splits
filetype plugin indent on
set splitbelow splitright
set hidden

" blocky cursor
autocmd BufReadPre * let &t_SI = "\<esc>[6 q" 
autocmd BufReadPre * let &t_SR= "\<esc>[4 q" 
autocmd BufReadPre * let &t_EI = "\<esc>[ q" 

" command
set report=0
set laststatus=2
set showmode
set showcmd
set ruler
set wildmode=longest,list,full
set wildmenu
set confirm
set clipboard=unnamed,unnamedplus

" status line
set statusline=File:\ %F
set statusline+=%=
set statusline+=Line#%l\,
set statusline+=\ Column#%c\, 
set statusline+=\ %p/100

" Enable mouse mode
set mouse="a"

" Save undo history
set undofile
set undodir=~/.config/vim/backups
set history=1000
set noswapfile

" Decrease update time
set updatetime=250
set timeoutlen=300

" line numbers
set number relativenumber

" tabs & indentation
set tabstop=2 
set shiftwidth=2 
set expandtab
set breakindent
set textwidth=80 

" search settings
set smartcase
set incsearch
set hlsearch

" cursor line and body
syntax on 
syntax enable
set wrap
set cursorline
set autoindent
set scrolloff=999
set encoding=utf-8

" misc
set termguicolors
set autoread
set backspace=indent,eol,start
set nocompatible
set noerrorbells
set visualbell
set ttyfast
set signcolumn=yes
let g:netrw_list_hide='.*\.swp$,\~$,\.orig$'


" center vertically in insert mode
inoremap zz <Esc>zzi

" move to beginning or end of line
inoremap <C-d> <esc>0i
inoremap <C-f> <esc>$a

" scroll whole page left/right
nnoremap <space><Right> zL
nnoremap <space><Left> zH

" turn off highlight w/ spacebar
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" spellcheck
nnoremap <space>o :setlocal spell! spelllang=en_us<CR>

" save file
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>i
nnoremap x "_x

" exit insert mode
inoremap kj <Esc>

" move line up and down
nnoremap mu :m .-2<CR>
nnoremap md :m .+1<CR>

" increment or decrement numbers
nnoremap + <C-a>
nnoremap - <C-x>

" window management
nnoremap qw :Explore<CR> 

nnoremap <space>to :tabnew<CR>
nnoremap <space>tx :close<CR>
nnoremap <S-t> :tabn<CR>

nnoremap <S-b> :bnext<CR>
nnoremap bd :bd<CR>
nnoremap dab :%bdelete<CR> 

" Tmux navigation
nnoremap <silent> <c-h> :<C-U>TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :<C-U>TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :<C-U>TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :<C-U>TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :<C-U>TmuxNavigatePrevious<cr>

" Plugin specific
nnoremap <space>f :Goyo<CR>
nnoremap ;f :FZF -e<CR>
nnoremap <silent> ;g <Plug>(coc-diagnostic-next)
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)
nnoremap <space>rn <Plug>(coc-rename)
nnoremap <silent> <space>k :call CocActionAsync('doHover')<cr>


