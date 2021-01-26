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

Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'LumaKernel/fern-mapping-fzf.vim'
Plug 'lambdalisue/fern-hijack.vim'
" Plug 'lambdalisue/fern-git-status.vim'
Plug 'antoinemadec/FixCursorHold.nvim' " fixes some perf issues in fern.vim
Plug 'lambdalisue/nerdfont.vim'
"
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'davidhalter/jedi-vim'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'janko-m/vim-test'
Plug 'groenewege/vim-less'
Plug 'neomake/neomake'
Plug 'psf/black', { 'branch': 'stable' }

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
Plug 'mhartington/oceanic-next'

"
" Syntax highlighting
"
Plug 'GEverding/vim-hocon'
Plug 'sheerun/vim-polyglot'


call plug#end()

augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END  

" fern related perf fix
let g:cursorhold_updatetime = 100

"
" General settings
"
set ttyfast
set showcmd
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
autocmd FileType html setlocal shiftwidth=2 tabstop=2 expandtab
set splitbelow
set splitright
set switchbuf=usetab
let g:vim_json_conceal=0
let g:vim_markdown_conceal=0
"set showtabline=2
"

" easier buffer control
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize -3<CR>
noremap <silent> <C-Down> :resize +3<CR>


" JEDI conf
let g:jedi#completions_enabled = 0


" file browser
nnoremap <leader>n :Fern . -reveal=% -drawer<CR>
nnoremap <C-n> :Fern . -drawer -toggle<CR>
let g:fern#renderer = "nerdfont"


call neomake#configure#automake('rw')
let g:neomake_python_enabled_makers = ['mypy', 'pylint']
"autocmd BufWritePre *.py execute ':Black'

"
" open gstatus in new tab

nnoremap <leader>s :tabe\|Gstatus<CR>

let g:deoplete#enable_at_startup = 1


"
" FZF
"
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :GitFiles<CR>
nnoremap <leader>t :BTags<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>r :Rg<CR>

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

" Theme
" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif
set background=dark
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext
let g:airline_theme='oceanicnext'

"
" Slime
"
let g:slime_target = "neovim"
let g:slime_python_ipython = 1
