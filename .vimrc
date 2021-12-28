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
"set autoindent
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

set colorcolumn=90
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

" PLUGIN MANAGER ---- VIM-PLUG 
call plug#begin('~/.vim/plugged')
    Plug 'lervag/vimtex'
    Plug 'lyuts/vim-rtags'
    Plug 'mbbill/undotree'
    Plug 'itchyny/lightline.vim'
    Plug 'morhetz/gruvbox'
    Plug 'preservim/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'tpope/vim-fugitive'
    Plug 'sainnhe/gruvbox-material'
call plug#end()

" Git fugitive config
nmap <leader>gs :G<CR>
nmap <leader>gp :Git push<CR>
nmap <leader>gc :Git commit<CR>

" NERD Tree Config.
nnoremap <C-f> :NERDTreeToggle<CR>

" COLORSCHEME : gruv box.
colorscheme gruvbox-material
set background=dark

" LightLine Config.
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'filename' : 'LightlineFilename',
      \ },
      \ }

function! LightlineFilename()
  return &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
        \ &filetype ==# 'unite' ? unite#get_status_string() :
        \ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
        \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
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
" Force Quit
nnoremap <silent> <leader>fq :q!<CR>

" C++17 Configuration # F5 for compilation & RUN
"autocmd filetype cpp nnoremap <f5> :!clear && g++ -W -Wall -o %:r.out % -std=c++17<cr> :!./%:r.out <cr>

autocmd filetype sh nnoremap <f5> :!clear && $HOME/compile.sh %<cr>
autocmd filetype cpp nnoremap <f5> :!clear && $HOME/compile.sh %<cr>

autocmd filetype cuda nnoremap <f5> :!clear && $HOME/compile.sh %<cr>

" C configuration # F5 for compilation & RUN.
autocmd filetype c nnoremap <f5> :!clear && $HOME/compile.sh %<cr>

"Python Execution
autocmd filetype python nnoremap <f5> :!clear && $HOME/compile.sh %<cr>

set showmatch
