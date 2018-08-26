call plug#begin('~/.local/share/nvim/plugegd')
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'neoclide/coc.nvim', {'do': 'yarn install'}
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'zchee/deoplete-jedi'
"Plug 'w0rp/ale'
"Plug 'davidhalter/jedi-vim'
Plug 'vim-python/python-syntax'
Plug 'scrooloose/nerdtree'
Plug 'yuttie/comfortable-motion.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-fugitive'
Plug 'metakirby5/codi.vim'
Plug 'cjrh/vim-conda'
Plug 'bfredl/nvim-ipy'
Plug 'lervag/vimtex'
Plug 'morhetz/gruvbox'
call plug#end()

set clipboard=unnamed

set splitbelow
set splitright


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
set background=dark
let g:gruvbox_italic=1
colorscheme gruvbox
" colorscheme solarized

if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
   set t_ut=
endif

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
"
"

vnoremap <silent> <leader>r :w ! python<CR>
nnoremap <leader>f :FZF<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>

"
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

"call deoplete#enable()

"call deoplete#custom#source('jedi', 'rank', 9999)
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#enable_ignore_case = 1
"let g:deoplete#enable_smart_case = 1
let g:jedi#completions_enabled = 0
"let g:deoplete#sources#jedi#show_docstring = 1
" use <tab> for trigger completion and navigate next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
" set completeopt+=noinsert
set scrolloff=3

nmap <silent> <leader>d <Plug>(coc-definition)<CR>
nmap <leader>o  <Plug>(coc-definition)<CR> 

"
"
"let g:ale_linters = {
"       \ 'LaTeX': ['chktex']
"       \ }
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_lint_on_enter = 'never'
let g:airline#extensions#ale#enabled = 1
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

" set the cursor to a vertical line in insert mode and a solid block
" in command mode
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
" upon hitting escape to change modes,
" send successive move-left and move-right
" commands to immediately redraw the cursor
inoremap <special> <Esc> <Esc>hl
"
" " don't blink the cursor
set guicursor+=i:blinkwait0


let g:tex_flavor = 'latex'
let g:vimtex_complete_recursive_bib = 1
let g:vimtex_compiler_latexmk = {
    \ 'executable' : 'latexmk.exe',
    \}
autocmd BufNewFile,BufRead *.tex setlocal wrap linebreak
autocmd BufNewFile,BufRead *.tex setlocal spell spelllang=en_us

let g:vimtex_view_general_viewer = 'sumatra'
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete
