let pluginstall=system("test -e ~/.local/share/nvim/site/autoload/plug.vim; echo $status")
if pluginstall != 0
    call system("curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim")
    so ~/.local/share/nvim/site/autoload/plug.vim
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'djoshea/vim-autoread'
Plug 'vim-scripts/vim-auto-save'
Plug 'mbbill/undotree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'wincent/ferret'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Chiel92/vim-autoformat'
Plug 'pangloss/vim-javascript'
Plug 'neomake/neomake'
Plug 'idanarye/vim-vebugger'
Plug 'dag/vim-fish'
Plug 'dmix/elvish.vim'
Plug 'kergoth/vim-bitbake'
Plug 'elmcast/elm-vim'
Plug 'rust-lang/rust.vim'
Plug 'w0rp/ale'
Plug 'Valloric/YouCompleteMe'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/vim-js-pretty-template'
Plug 'Quramy/tsuquyomi'
call plug#end()

if pluginstall != 0
    :PlugInstall
endif

" leader
let mapleader = "\<Space>"

" autosave
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0

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

" git gutter
let g:gitgutter_highlight_lines = 0
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

" settings
set number
set list listchars=tab:▸-,trail:⊡
set colorcolumn=80
set showmatch
set incsearch ignorecase smartcase
set noswapfile
set nowrap
set shiftwidth=4 softtabstop=4 tabstop=4 expandtab

filetype plugin on
autocmd FileType cpp setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
autocmd FileType elm setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab

" fzf
nnoremap <leader>o :GFiles<cr>
nnoremap <leader>c :GFiles?<cr>
nnoremap <leader>b :Buffers<cr>

" js
"autocmd FileType typescript JsPreTmpl html
"autocmd FileType typescript syn clear foldBraces

" elm
let g:elm_setup_keybindings = 0

" netrw
command! E Explore
nnoremap <leader>e :E<cr>
let g:netrw_localrmdir='rm -r'
let g:netrw_banner="0"
let g:netrw_sort_sequence=""

" autoformat on save
nnoremap <leader>fe :au BufWrite * :Autoformat<cr>
nnoremap <leader>fd :au! BufWrite<cr>
nnoremap <leader>ff :Autoformat<cr>

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

" ale
let g:ale_linters = {
\   'cpp': ['cpplint', 'cppcheck'],
\}

" you complete me
let g:ycm_rust_src_path = '$HOME/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src/'

" use system clipboard
set clipboard=unnamed
