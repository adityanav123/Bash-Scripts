set nu rnu " set line number

" set line pointer
""set cursorline
""set cursorcolumn

" tab spaces config.
set shiftwidth=4
set tabstop=4
set expandtab " use space char instead of tabs.
set softtabstop=4

" enable syntax highlighting.
syntax on

"Autoidentation
set autoindent
set cindent

" don't start beeping on errors.
set visualbell
set errorbells

" donot wrap the lines.
set nowrap

" will search the text as you type.
set incsearch
set smartcase

"no swap file
set noswapfile

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" show the last command typed below.
set showcmd

" copy from external source to the vim file.
set clipboard^=unnamed,unnamedplus

"ignore captial letters during SEARCH.
set ignorecase

" show matching words during SEARCH
set showmatch

" highlight the word while searching
set hlsearch

" auto-completion menu
set wildmenu

" certain files we donot want to edit with vim.
set wildignore=*.docx,*jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx


set clipboard^=unnamed,unnamedplus

" set FONT.
if has('gui_running')
    set guifont=Input\ Mono\ Light\ 14
endif

" THEMES in VIM
""colorscheme industry

" PLUGIN MANAGER ---- VIM-PLUG 
call plug#begin('~/.vim/plugged')
    Plug 'lervag/vimtex'
    Plug 'lyuts/vim-rtags'
    Plug 'Valloric/YouCompleteMe'
    Plug 'mbbill/undotree'
    Plug 'itchyny/lightline.vim'

call plug#end()

set laststatus=2
set noshowmode
" Window Commands
let mapleader = " "
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>pv :wincmd v<CR>
nnoremap <leader>u :UndotreeShow<CR>

" You Complete Me
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

" Close Preview from YouCompleter
nnoremap <silent> <Leader>pc :pc<CR>

" Open a New Tab
nnoremap <silent> <Leader>n :tabnew<CR>
" Save and Quit
nnoremap <silent> <Leader>q :wq<CR>

" NERDTree Config.
"map <C-n> :NERDTreeToggle<cr>

" C++17 Configuration # F5 for compilation & RUN
"autocmd filetype cpp nnoremap <f5> :!clear && g++ -W -Wall -o %:r.out % -std=c++17<cr> :!./%:r.out <cr>

autocmd filetype cpp nnoremap <f5> :!clear && $HOME/compile.sh %<cr>

" C configuration # F5 for compilation & RUN.
autocmd filetype c nnoremap <f5> :!clear && $HOME/compile.sh %<cr>

"Python Execution
autocmd filetype python nnoremap <f5> :!clear && $HOME/compile.sh %<cr>

"Python
autocmd filetype python map <buffer> <F9> :!clear && w<cr>:exec '!python3' shellescape(@%, 1)<cr>
set showmatch
