" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
"
" fuzzy everything
"
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" 
" git support
"
Plug 'kdheepak/lazygit.nvim', { 'branch': 'nvim-v0.4.3' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' " for Gbrowse
"
" file and project management
"
Plug 'mhinz/vim-startify'


" autocomplete
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

" unit test runner
Plug 'janko-m/vim-test'

"
" Data Science shit
"
Plug 'jpalardy/vim-slime'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"
" UI tweaks
"
" bindings help
Plug 'liuchengxu/vim-which-key'
Plug 'lambdalisue/nerdfont.vim'
Plug 'mhartington/oceanic-next'
Plug 'sainnhe/sonokai'
" Syntax highlighting
Plug 'GEverding/vim-hocon'
Plug 'sheerun/vim-polyglot'
Plug 'groenewege/vim-less'

Plug 'christoomey/vim-tmux-navigator'

" note taking
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
call plug#end()

"
" General settings
"
set ttyfast
set showcmd
set hidden " TextEdit might fail if hidden is not set.
let mapleader = ' '
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
set signcolumn=yes " Always show the signcolumn, otherwise it would shift the text each time diagnostics appear/become resolved.
if (has("termguicolors"))
 set termguicolors
endif
set completeopt=noinsert,menuone,noselect
set ignorecase
set smartcase
set nowrapscan " when searching, stop at the end of document

augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END  


"
" lazygit
nnoremap <silent> <leader>gg :LazyGit<CR>
nnoremap <silent> <leader>ga :Git add %<CR>
nnoremap <silent> <leader>gd :Gdiffsplit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>

"
" fugitive
"
autocmd BufReadPost fugitive://* set bufhidden=delete " auto delete fugitive buffers

" easier buffer control
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize -3<CR>
noremap <silent> <C-Down> :resize +3<CR>

" locallist navigation
nnoremap <silent> <leader>lo :lopen<CR>
nnoremap <silent> <leader>ln :lnext<CR>
nnoremap <silent> <leader>lp :lprev<CR>
nnoremap <silent> <leader>lc :lclose<CR>
" quickfix list navigation
nnoremap <silent> <leader>cc :cclose<CR>
nnoremap <silent> <leader>co :copen<CR>
nnoremap <silent> <leader>cn :cnext<CR>
nnoremap <silent> <leader>cp :cnext<CR>
nnoremap <silent> <M-n> :cnext<CR>
nnoremap <silent> <M-p> :cprev<CR>
" Better tabbing
vnoremap < <gv
vnoremap > >gv


nnoremap <silent> <leader>xb :!black %<CR>
nnoremap <silent> <leader>xB :!black --check .<CR>


"
" FZF
"
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :GitFiles<CR>
nnoremap <leader>ft :BTags<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fr :Rg<CR>
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --margin=1,4"

"
" Python unittest
"
nnoremap <leader>tn :TestNearest<CR>

" Theme
let g:sonokai_style = 'atlantis'
let g:sonokai_enable_italic = 1
colorscheme sonokai
let g:airline_theme = 'sonokai'

"
" Slime
"
let g:slime_target = "neovim"
let g:slime_python_ipython = 1
function OpenTermWithSlimeAttached()
	:vs
	:term
	let job_id = b:terminal_job_id
	:wincmd h
	let b:slime_config ={"jobid": job_id}
	:wincmd l
endfunction
nnoremap <leader>xc :vs\|:term <CR>
nnoremap <leader>xs :call OpenTermWithSlimeAttached()<CR>
let g:slime_cell_delimiter = "#%%"
nmap <c-c><c-e> <Plug>SlimeSendCell
tnoremap <M-Esc> <C-\><C-n>


"
" startify
"
let g:startify_session_delete_buffers = 1
let g:startify_change_to_dir = 0

" UX help with bindings
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>

"
" LSP
"
luafile ~/.config/nvim/lsp.lua
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gw <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gb <cmd>lua vim.lsp.buf.buffer_symbol()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
set conceallevel=0
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

let g:netrw_list_style = 3


let g:vim_markdown_folding_disabled = 1


autocmd BufNewFile,BufRead *.md lcd %:p:h
