let mapleader=" "

stopi
colorscheme habamax 


call plug#begin('~/.config/vim/plugins')
  Plug 'junegunn/goyo.vim'
  Plug 'tpope/vim-surround'
  Plug 'PotatoesMaster/i3-vim-syntax'
  Plug 'jreybert/vimagit'
  Plug 'LukeSmithxyz/vimling'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'neoclide/coc.nvim'
call plug#end()


" coc config
let g:coc_global_extensions = [
      \ 'coc-snippets',
      \ 'coc-pairs',
      \ 'coc-tsserver',
      \ 'coc-eslint',
      \ 'coc-prettier',
      \ 'coc-json',
      \]



inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'



" buffers and splits
set splitbelow splitright
set hidden

" blocky cursor
let &t_SI = "\<esc>[6 q" 
let &t_SR= "\<esc>[4 q" 
let &t_EI = "\<esc>[ q" 

" command
set laststatus=2
set report=0
set laststatus=2
set showmode
set showcmd
set ruler
set wildmode=longest,list,full
set wildmenu
set confirm
set clipboard=unnamed,unnamedplus


" Enable mouse mode
set mouse="a"


" Save undo history
set undofile
set history=1000

" Decrease update time
set updatetime=250
set timeoutlen=300

" line numbers
set number relativenumber

" tabs & indentation
set tabstop=2 
set shiftwidth=2 
set expandtab
set autoindent 
set breakindent
set textwidth=80 

" search settings
set ignorecase
set smartcase

" cursor line and body
syntax on
set wrap
set cursorline
set autoindent

" misc
set backspace=indent,eol,start
set incsearch
set nocompatible
set noerrorbells
set visualbell
set ttyfast
let g:netrw_list_hide='.*\.swp$,\~$,\.orig$'





" center vertically in insert mode
inoremap zz <Esc>zzi

" commenting
nnoremap <leader>/ I//<Esc>

" move to beginning or end of line
inoremap <C-d> <esc>0i
inoremap <C-f> <esc>$a

" scroll whole page left/right
nnoremap <leader><Right> zL
nnoremap <leader><Left> zH

" spellcheck
nnoremap <leader>o :setlocal spell! spelllang=en_us<CR>

" save file
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>i

" exit insert mode
inoremap kj <Esc>

" move text up and down
nnoremap mu :m .-2<CR>
nnoremap md :m .+1<CR>

" increment or decrement numbers
nnoremap + <C-a>
nnoremap - <C-x>

" window management
nnoremap qw :Explore<CR> #toggle explorer

nnoremap <leader>to :tabnew<CR> #open new tab
nnoremap <leader>tx :close<CR> #close current tab
nnoremap <S-t> :tabn<CR> #go to next tab

nnoremap <S-b> :bnext<CR> #next buffeB
nnoremap bd :bd<CR> #delete current buffer
nnoremap dab :%bdelete<CR> #delete all buffers

" Plugin specific
nnoremap <leader>f :Goyo<CR>






filetype plugin on
inoremap ;; <Esc>/++++<CR>"_c4l


autocmd FileType html nnoremap <leader>/ mqA--><Esc>I<!--<Esc>"q

autocmd FileType html inoremap ;i <em></em><Space>++++<Esc>F>%i
autocmd FileType html inoremap ;b <strong></strong><Space>++++<Esc>F>%i
autocmd FileType html inoremap ;1 <h1></h1><Space>++++<Esc>F>%i
autocmd FileType html inoremap ;2 <h2></h2><Space>++++<Esc>F>%i
autocmd FileType html inoremap ;3 <h3></h3><Space>++++<Esc>F>%i
autocmd FileType html inoremap ;4 <h4></h4><Space>++++<Esc>F>%i
autocmd FileType html inoremap ;5 <h5></h5><Space>++++<Esc>F>%i
autocmd FileType html inoremap ;6 <h6></h6><Space>++++<Esc>F>%i

autocmd FileType html inoremap ;f <form action="" method="GET"></form><Space>++++<Esc>F>%i
autocmd FileType html inoremap ;n <input type="text" name="" value="" /><Esc>Fm4li
autocmd FileType html inoremap ;c <button></button><Space>++++<Esc>F>%i
autocmd FileType html inoremap ;sp <span></span><Space>++++<Esc>F>%i
autocmd FileType html inoremap ;p <p></p><Space>++++<Esc>F>%i
autocmd FileType html inoremap ;d <div></div><Space>++++<Esc>F>%i
autocmd FileType html inoremap ;se <section></section><Space>++++<Esc>F>%i



"function! s:on_lsp_buffer_enabled() abort
    "setlocal omnifunc=lsp#complete
    "setlocal signcolumn=yes
    "if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
"
    "let g:lsp_format_sync_timeout = 1000
    "autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
"endfunction
"
"augroup lsp_install
    "au!
    "" call s:on_lsp_buffer_enabled (set the lsp shortcuts) when an lsp server
    "" is registered for a buffer.
    "autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
"augroup END
