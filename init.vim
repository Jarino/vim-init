" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

"
" IDE features
"
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' " for Gbrowse
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'rbgrouleff/bclose.vim' " ranger dependency
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }



"
" LSP
"
" Plug 'dense-analysis/ale'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
"
" Data Science shit
"
Plug 'jpalardy/vim-slime'

"
" UI/UX
"
Plug 'vim-airline/vim-airline'
Plug 'thaerkh/vim-indentguides'
Plug 'yuttie/comfortable-motion.vim'
Plug 'hzchirs/vim-material'

"
" Syntax highlighting
"
Plug 'GEverding/vim-hocon'
Plug 'sheerun/vim-polyglot'


call plug#end()



"
" General settings
"
set hidden " TextEdit might fail if hidden is not set.
let mapleader = ','
set clipboard+=unnamedplus
set cursorline
set relativenumber number
nnoremap <TAB> :bn<CR>
nnoremap <S-TAB> :bp<CR>
nnoremap <leader>q :bp\|bd #<CR>
set scrolloff=4
set mouse=a
set nowrap
set hls is
autocmd FileType css setlocal shiftwidth=4 tabstop=4
autocmd FileType html setlocal shiftwidth=4 tabstop=4
set splitbelow
set splitright
let g:vim_json_conceal=0
"set showtabline=2

let g:LanguageClient_serverCommands = {
	\ 'python': ['pyls'],
	\ 'typescript': ['./node_modules/typescript/bin/tsserver'],
	\ }
let g:LanguageClient_useVirtualText = 'No'

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
noremap <leader>rn :call LanguageClient#textDocument_rename()<CR>
nnoremap <leader>B :call LanguageClient#textDocument_documentSymbol()<CR>
nnoremap <leader>T :call LanguageClient#workspace_symbol()<CR>
nnoremap <silent>gr :call LanguageClient#textDocument_references()<CR>
nnoremap <leader>n :NERDTreeFind<CR>
nnoremap <C-n> :NERDTreeToggle<CR>


"
" open gstatus in new tab

nnoremap <leader>s :tabe\|Gstatus<CR>

let g:deoplete#enable_at_startup = 1


let g:NERDTreeHijackNetrw = 1 " add this line if you use NERDTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMouseMode = 3 " single click to open any node
let g:NERDTreeMinimalUI = 1

"
" FZF
"
nnoremap <leader>f :GitFiles<CR>
nnoremap <leader>F :FZF<CR>
nnoremap <leader>g :Ag<CR>
nnoremap <leader>b :BTags<CR>
nnoremap <leader>t :Tags<CR>

set signcolumn=yes " Always show the signcolumn, otherwise it would shift the text each time diagnostics appear/become resolved.

function OpenTermWithSlimeAttached()
	:vs
	:term
	let job_id = b:terminal_job_id
	:wincmd h
	let b:slime_config ={"jobid": job_id}
	:wincmd l
endfunction
nnoremap <leader>c :vs\|:term<CR>
nnoremap <leader>C :call OpenTermWithSlimeAttached()<CR>
let g:slime_cell_delimiter = "#%%"
nmap <c-c><c-e> <Plug>SlimeSendCell


" Airline
"
"
let g:airline#extensions#tabline#enabled = 1


if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif
set termguicolors
set background=dark
colorscheme vim-material
let g:airline_theme='material'
"
" Slime
"
let g:slime_target = "neovim"
let g:slime_python_ipython = 1
