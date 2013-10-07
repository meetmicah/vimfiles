" Lets
set number
let mapleader = ","

" Sets
set number
syntax enable
set autoindent
set hlsearch

" Press F4 to toggle highlighting on/off, and show current value.
noremap <F4> :set hlsearch! hlsearch?<CR>

" Enable Viewing Whitespace
set list
set listchars=tab:·\ ,extends:>,precedes:<,trail:·

" Rulers ftw!
autocmd BufNewFile,BufRead *.rb setlocal colorcolumn=80
autocmd BufNewFile,BufRead *.php setlocal colorcolumn=100
autocmd BufNewFile,BufRead COMMIT_EDITMSG setlocal colorcolumn=72

" Pathogen - package manager
execute pathogen#infect()

" wrap the cursor to prev/next line
set whichwrap=<,>,h,l,[,]

" NerdTree File Manager
nnoremap <silent> <Leader>p :NERDTreeToggle<CR>
map <Leader>o :BookmarkToRoot pj<CR>

" Ctrlp
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_custom_ignore = '\v\~$|\.(o|exe|dll|bak|orig|swp|jpg|png|gif)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|vendor/|tmp/cache|_site|node_modules|^tmp'
nnoremap <silent> <Leader>y :CtrlPBuffer<CR>
nnoremap <silent> <Leader>T :CtrlPBufTag<CR>
nnoremap <silent> <Leader>r :CtrlPMRU<CR>
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
