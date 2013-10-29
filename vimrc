" Lets
let mapleader = ","
syntax enable
set number
set autoindent
set hlsearch
set clipboard=unnamed
filetype plugin indent on
set backspace=indent,eol,start

" Don't add trailing EOL in PHP files
autocmd FileType php setlocal noeol binary fileformat=dos

" Press F4 to toggle highlighting on/off, and show current value.
noremap <F4> :set hlsearch! hlsearch?<CR>

" Enable Viewing Whitespace
set list
set listchars=tab:>-,trail:~,extends:>,precedes:<

" Rulers ftw!
autocmd BufNewFile,BufRead *.rb setlocal colorcolumn=80
autocmd BufNewFile,BufRead *.php setlocal colorcolumn=100
autocmd BufNewFile,BufRead COMMIT_EDITMSG setlocal colorcolumn=72

" Pathogen - package manager
execute pathogen#infect()

" Ack Helper
command -nargs=1 F Ack -C 2 <args>

" Scroll Off
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

" wrap the cursor to prev/next line
set whichwrap=<,>,h,l,[,]

" NerdTree File Manager
nnoremap <silent> <Leader>p :NERDTreeToggle<CR>
map <Leader>o :BookmarkToRoot pj<CR>
map <Leader>* :NERDTreeFind<CR>

" Ctrlp
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_custom_ignore = '\v\~$|\.(o|exe|dll|bak|orig|swp|jpg|png|gif)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|vendor/|tmp/cache|_site|node_modules|^tmp'
nnoremap <silent> <Leader>y :CtrlPBuffer<CR>
nnoremap <silent> <Leader>T :CtrlPBufTag<CR>
nnoremap <silent> <Leader>r :CtrlPMRU<CR>
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_show_hidden = 1
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_prompt_mappings = {
  \ 'PrtSelectMove("j")': ['<c-n>', '<c-j>', '<down>'],
  \ 'PrtSelectMove("k")': ['<c-p>', '<c-k>', '<up>'],
  \ 'PrtHistory(-1)': ['<c-h>'],
  \ 'PrtHistory(1)': ['<c-l>'],
  \ 'PrtCurLeft()': ['<left>', '<c-^>'],
  \ 'PrtCurRight()': ['<right>'],
  \ }

" git
nnoremap <silent> <Leader>gs :Gstatus<CR>
nnoremap <silent> <Leader>gc :Gcommit -v<CR>
nnoremap <silent> <Leader>gd :Gdiff<CR>
nnoremap <silent> <Leader>gb :Gblame<CR>

" ZoomWin
nnoremap <silent> <Leader>z :ZoomWin<CR>

" Auto Complete [:
let g:neocomplcache_enable_at_startup = 1

" Disable arrow keys
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" Auto detect indention
autocmd BufReadPost * :DetectIndent

" Trim trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Theme
colorscheme molokai

" PHP Documentor
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
autocmd BufNewFile,BufRead *.php iabbrev /** <Down><Esc>:call pdv#DocumentWithSnip()<Cr>

" Reload VIMRC
nnoremap <Leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
