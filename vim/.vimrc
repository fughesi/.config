let mapleader = " "


" center vertically in insert mode
inoremap zz <ESC>zzi

" move to beginning or end of line
inoremap <C-d> <ESC>0i
inoremap <C-f> <ESC>$a

" scroll whole page left/right
nnoremap <leader><Right> zL
nnoremap <leader><Left> zH

" save file
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>i

" exit insert mode
inoremap kj <ESC>

" move text up and down
nnoremap mu :m .-2<CR>
nnoremap md :m .+1<CR>

" increment or decrement numbers
nnoremap + <C-a>
nnoremap - <C-x>

" window management
nnoremap <leader>sv <C-w>v # vertical split
nnoremap <leader>sh <C-w>s #split window horizontally
nnoremap <leader>se <C-w>= #make split windows equal width & height
nnoremap <leader>sx :close<CR> #close current split window
nnoremap qw :NvimTreeToggle<CR> #toggle file explorer

nnoremap ˚ :resize +4<CR> #resize up using arrow
nnoremap ∆ :resize -4<CR> #resize down using arrow
nnoremap ˙ :vertical resize +4<CR> #resize left using arrow
nnoremap ¬ :vertical resize -4<CR> #resize right using arrow
nnoremap µ :MaximizerToggle<CR> #toggle split window maximization


nnoremap <leader>to :tabnew<CR> #open new tab
nnoremap <leader>tx :tabclose<CR> #close current tab
nnoremap <S-t> :tabn<CR> #go to next tab

nnoremap <S-b> :bnext<CR> #next buffer
nnoremap bd :bd<CR> #delete current buffer
nnoremap dab :%bdelete<CR> #delete every single buffer






" Set highlight on search
set nohlsearch

" Enable mouse mode
set mouse="a"

" Enable break indent
set breakindent

" Save undo history
set undofile

" Decrease update time
set updatetime=250
set timeoutlen=300

" line numbers
set relativenumber

" tabs & indentation
set tabstop=2 " 2 spaces for tabs (prettier default)
set shiftwidth=2 " 2 spaces for indent width
set expandtab " expand tab to spaces
set autoindent " copy indent from current line when starting new one
set textwidth=80 " wrap lines larger than 80 chars

" line wrapping
set nowrap

" search settings
set ignorecase
set smartcase

" cursor line
set cursorline

" turn on termguicolors for nightfly colorscheme to work
set termguicolors
set background="dark" " colorschemes that can be light or dark will be made dark
set signcolumn="yes" " show sign column so that text doesn't shift

" backspace
set backspace="indent,eol,start" " allow backspace on indent, end of line or insert mode start position
