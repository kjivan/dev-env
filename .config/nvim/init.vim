if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-sensible'

Plug 'sheerun/vim-polyglot'
Plug 'Quramy/vim-js-pretty-template'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'ap/vim-css-color'

Plug 'gruvbox-community/gruvbox'
Plug 'itchyny/lightline.vim'

Plug 'djoshea/vim-autoread'
Plug 'vim-scripts/vim-auto-save'
Plug 'mbbill/undotree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-rooter'
Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
Plug 'lotabout/skim.vim'
Plug 'wincent/ferret'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'cohama/lexima.vim'
Plug 'tomtom/tcomment_vim'
Plug 'luochen1990/rainbow'

Plug 'mattn/webapi-vim'
Plug 'mattn/vim-gist'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'williamboman/nvim-lsp-installer'
call plug#end()

" leader
let mapleader = "\<Space>"

" writing
nnoremap <leader>w :set spell<cr>

" autosave
let g:auto_save_in_insert_mode = 0
let g:auto_save = 1
nnoremap <leader>se :let g:auto_save = 1<cr>
nnoremap <leader>sd :let g:auto_save = 0<cr>
nnoremap <leader>ss :w<cr>

" style
if (has("termguicolors"))
    set termguicolors
endif
colorscheme gruvbox
set background=dark
let g:one_allow_italics = 1
let g:lightline = { 'colorscheme': 'gruvbox' }

" make esc faster
set timeoutlen=1000 ttimeoutlen=0

" general key binds
nmap <silent> <leader>v :e $MYVIMRC<cr>
nmap <silent> <leader>vv :so $MYVIMRC<cr>
nnoremap <leader>q :q<CR>
nmap <silent> <leader>/ :nohlsearch<cr>
nnoremap <silent><Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent><Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent><Leader>> :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent><Leader>< :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

" git gutter
let g:gitgutter_highlight_lines = 0
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" settings
set relativenumber
set number
set list listchars=tab:▸\ ,trail:.,extends:>
set showmatch
set incsearch ignorecase smartcase
set noswapfile
set nowrap
set shiftwidth=2 softtabstop=2 tabstop=2 expandtab
set spelllang=en_us
set iskeyword+=-

filetype plugin on
autocmd FileType cpp setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
autocmd FileType go,gradle setlocal shiftwidth=2 softtabstop=2 tabstop=2 noexpandtab
autocmd FileType go,java setlocal shiftwidth=4 softtabstop=4 tabstop=4 noexpandtab

" remove trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction

nnoremap <leader>t :call TrimWhiteSpace()<cr>

" fzf
nnoremap <leader>p :Files<cr>
nnoremap <leader>o :GFiles<cr>
nnoremap <leader>c :GFiles?<cr>
nnoremap <leader>b :Buffers<cr>
let g:fzf_preview_window = ''

" elm
let g:elm_setup_keybindings = 0

" netrw
command! E Explore
nnoremap <leader>e :E<cr>
nnoremap <leader>r :Rexplore<cr>
let g:netrw_localrmdir='rm -r'
let g:netrw_banner="0"
let g:netrw_sort_sequence=""

" undotree saves to undo dir and add shortcut
let vimDir = '$HOME/.config/nvim'
let &runtimepath.=','.vimDir
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif
nnoremap <leader>u :UndotreeToggle<cr>:UndotreeFocus <cr><Paste>

" emmet
let g:user_emmet_leader_key=','

" rainbow parentheses
let g:rainbow_active = 1

" use system clipboard
set clipboard^=unnamed,unnamedplus

let g:FerretExecutableArguments = {
  \   'rg': '--vimgrep --no-heading --no-config --max-columns 4096'
  \ }
vmap <leader>s y:Ack <C-R>"<cr>

nnoremap <leader>j :cn <cr>
nnoremap <leader>k :cp <cr>

source $HOME/.config/nvim/lsp.vim
source $HOME/.config/nvim/cmp.vim
