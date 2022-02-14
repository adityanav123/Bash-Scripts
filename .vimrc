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
    Plug 'vwxyutarooo/nerdtree-devicons-syntax'
    Plug 'scrooloose/nerdcommenter'
    Plug 'tpope/vim-fugitive'
    Plug 'sainnhe/gruvbox-material'
    Plug 'neoclide/coc.nvim'
    Plug 'tmux-plugins/vim-tmux'
call plug#end()

" CoC Configuration""""
let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-pairs',
    \ 'coc-eslint',
    \ 'coc-prettier',
    \]
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Command + Space triggers completion
inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


"Code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

"highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" coc-prettier command
command! -nargs=0 Prettier :CocCommand prettier.formatFile


""""""""""""""""""""""""""""

" NERD Tree Config.
nnoremap <C-f> :NERDTreeToggle<CR>
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif


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
nnoremap <C-s> :w<CR>

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
