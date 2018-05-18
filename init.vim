call plug#begin('~/.local/share/nvim/plugegd')

Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
" Plug 'w0rp/ale'
Plug 'davidhalter/jedi-vim'
Plug 'vim-python/python-syntax'
" Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'yuttie/comfortable-motion.vim'
"Plug 'lervag/vimtex'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-fugitive'
Plug 'metakirby5/codi.vim'
Plug 'cjrh/vim-conda'
call plug#end()
"
"
" " general settings
" "
set number
set showmatch
set expandtab
set tabstop=2
set shiftwidth=2
set colorcolumn=80
set nowrap
"
" " color scheme settings
syntax on
colorscheme onedark
"
let mapleader=","
let g:codi#rightalign = 0
"
let g:airline#extensions#vimtex#enabled = 1
"
" " airline (status bar down below and at tabs)
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"
" " fuzzy open shortcut
" "
" "nnoremap <C-p> :FuzzyOpen<CR>
" "nnoremap <leader>p :FuzzyGrep<CR>
" nnoremap <C-p> :CtrlP<CR>
" nnoremap <leader>p :CtrlPTag<CR>
"
" nmap <silent> <leader>s <Plug>(CommandTTag)

nnoremap <leader>f :FZF<CR>
nnoremap <leader>t :Tags<CR>

"
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

call deoplete#enable()

call deoplete#custom#source('jedi', 'rank', 9999)
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:jedi#completions_enabled = 0
let g:deoplete#sources#jedi#show_docstring = 1

set completeopt+=noinsert
set scrolloff=3

"
"
" let g:ale_linters = {
"       \ 'python': ['flake8']
"             \ }
"             let g:ale_fixers = {
"             \ 'python': []
"             \}
"
"             let g:ale_lint_on_text_changed = 'never'
"             let g:airline#extensions#ale#enabled = 1
"
"
"             " Go to definition
let g:jedi#goto_command = ',d'
" Find ocurrences
let g:jedi#usages_command = ',o'
" " Find assignments
let g:jedi#goto_assignments_command = ',a'
" " Go to definition in new tab
nmap ,D :tab split<CR>:call jedi#goto()<CR>
"
"
" " in order to be able to run nvim in virtualenv
" let g:python3_host_prog='/home/jarino/anaconda3/bin/python'
"
nmap <C-n> :NERDTreeToggle<CR>
"
let g:python_highlight_all = 1
" 
