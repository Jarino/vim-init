call plug#begin('~/.local/share/nvim/plugegd')

Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'w0rp/ale'
Plug 'davidhalter/jedi-vim'
Plug 'vim-python/python-syntax'
" Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'yuttie/comfortable-motion.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-fugitive'
Plug 'metakirby5/codi.vim'
Plug 'cjrh/vim-conda'
Plug 'bfredl/nvim-ipy'
Plug 'altercation/vim-colors-solarized'
Plug 'lervag/vimtex'
call plug#end()



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
colorscheme onedark
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

" set completeopt+=noinsert
set scrolloff=3

"
"
let g:ale_linters = {
       \ 'LaTeX': ['chktex']
       \ }
" let g:ale_lint_on_text_changed = 'never'
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



let g:vimtex_compiler_latexmk = {
    \ 'executable' : 'latexmk.exe',
    \}


let g:vimtex_view_general_viewer = 'sumatra'
