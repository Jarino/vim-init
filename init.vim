" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
"
" fuzzy everything
"
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-project.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" 
" git support
"
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' " for Gbrowse
"
" file and project management
"
Plug 'mhinz/vim-startify'
Plug 'airblade/vim-rooter'
Plug 'cjrh/vim-conda'

"
" python specific
"
Plug 'jeetsukumaran/vim-pythonsense' " python text objects

" linting
Plug 'neomake/neomake'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'

"
" nvim-dap
"
Plug 'mfussenegger/nvim-dap'

" unit test runner
Plug 'vim-test/vim-test'

"
" Data Science shit
"
Plug 'jpalardy/vim-slime'

"
" UI tweaks
"
" bindings help
Plug 'liuchengxu/vim-which-key'
" looks
Plug 'sainnhe/sonokai'
" Syntax highlighting
Plug 'groenewege/vim-less'
" sugar
Plug 'kyazdani42/nvim-web-devicons'
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
autocmd FileType html setlocal shiftwidth=0 tabstop=2 expandtab
set shiftwidth=0
set tabstop=2
set expandtab
set splitbelow
set splitright
set switchbuf=usetab
set signcolumn=yes " Always show the signcolumn, otherwise it would shift the text each time diagnostics appear/become resolved.
if (has("termguicolors"))
 set termguicolors
endif
set completeopt=menu,menuone,noselect
set ignorecase
set smartcase
"set nowrapscan " when searching, stop at the end of document
set shortmess-=F
inoremap jk <ESC>
tnoremap <C-j><C-k> <C-\><C-n>

augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END  


"
" git
"
nnoremap <silent> <leader>ga :Git add %<CR>
nnoremap <silent> <leader>gd :Gdiffsplit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
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
nnoremap <silent> <leader>lt :Telescope loclist theme=get_ivy<CR>
" quickfix list navigation
nnoremap <silent> <leader>cc :cclose<CR>
nnoremap <silent> <leader>co :copen<CR>
nnoremap <silent> <leader>cn :cnext<CR>
nnoremap <silent> ]c :cnext<CR>
nnoremap <silent> [c :cprev<CR>
nnoremap <silent> <leader>cp :cnext<CR>
nnoremap <silent> <leader>ct :Telescope quickfix theme=get_ivy<CR>
" Better tabbing
vnoremap < <gv
vnoremap > >gv


nnoremap <silent> <leader>xb :!black %<CR>
nnoremap <silent> <leader>xB :!black --check .<CR>
nnoremap <silent> <leader>xj :%!python -m json.tool<CR>
nnoremap <silent> <leader>xt :!ctags -R *<CR>

nnoremap <leader>ff :Telescope find_files theme=ivy<CR>
nnoremap <leader>fb :Telescope buffers theme=get_ivy<CR>
nnoremap <leader>fr :Telescope live_grep theme=get_ivy<CR>
nnoremap <leader>fs :Telescope grep_string theme=get_ivy<CR>
nnoremap <leader>fi :Telescope file_browser cwd=%:p:h theme=get_ivy<CR>
nnoremap <leader>fd :Telescope lsp_document_symbols theme=get_ivy<CR>
nnoremap <leader>fg :Telescope git_files theme=get_ivy<CR>
nnoremap <leader>fq :Telescope quickfix theme=get_ivy<CR>
nnoremap <leader>fj :Telescope jumplist theme=get_ivy<CR>
nnoremap <leader>ft :Telescope tags theme=get_ivy<CR>
nnoremap <leader>fh :Telescope help_tags theme=get_ivy<CR>

nnoremap <leader>s :Startify<CR>

nnoremap <leader>nn :e /home/jarino/.config/nvim/init.vim<CR>
nnoremap <leader>ns :so /home/jarino/.config/nvim/init.vim<CR>


"
" unittest runner
"
nnoremap <leader>un :TestNearest<CR>
nnoremap <leader>uf :TestFile<CR>
let test#strategy = "neovim"

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
	call jobsend(job_id, "ipython\n")
	:wincmd h
endfunction
function OpenTermWithSlimeAttachedHorizontal()
	:split
	:term
	let job_id = b:terminal_job_id
	:wincmd k
	let b:slime_config ={"jobid": job_id}
	:wincmd j
	call jobsend(job_id, "ipython\n")
	:wincmd k
endfunction
let g:slime_cell_delimiter = "#%%"
nmap <c-c><c-e> <Plug>SlimeSendCell

"
" terminal shortcuts
"
nnoremap <leader>tt :term<CR>
nnoremap <leader>tv :vs\|:term<CR>
nnoremap <leader>ts :split\|:term<CR>
nnoremap <leader>tav :call OpenTermWithSlimeAttached()<CR>
nnoremap <leader>tas :call OpenTermWithSlimeAttachedHorizontal()<CR>
nnoremap <leader>it :call termopen('CONDA_BASE=$(conda info --base) && source $CONDA_BASE/etc/profile.d/conda.sh && conda activate $CONDA_PREFIX && ipython')<CR>

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
}
EOF
colorscheme sonokai

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
nnoremap <silent> <leader>h <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>k <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <leader>r <cmd>lua vim.lsp.buf.rename()<CR>
set conceallevel=0
"autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

let g:netrw_list_style = 3
"
" neomake linting
"
call neomake#configure#automake('rw')
let g:neomake_python_enabled_makers = ['mypy']

"
" change root
"
let g:rooter_patterns = ['pyrightconfig.json', '.git']


"
" nvim-dap
"
luafile ~/.config/nvim/dap.lua
nnoremap <leader>dt <cmd>lua require'dap'.toggle_breakpoint()<CR>
nnoremap <leader>dc <cmd>lua require'dap'.continue()<CR>
nnoremap <leader>dso <cmd>lua require'dap'.step_over()<CR>
nnoremap <leader>dsi <cmd>lua require'dap'.step_into()<CR>
nnoremap <leader>dss <cmd>lua require'dap.ui.variables'.scopes()<CR>

