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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'wincent/ferret'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'idanarye/vim-vebugger'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'

Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-vetur', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-rls', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-angular', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-spell-checker', {'do': 'yarn install --frozen-lockfile'}
call plug#end()

" leader
let mapleader = "\<Space>"

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

" git gutter
let g:gitgutter_highlight_lines = 0
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" settings
set relativenumber
set number
set list listchars=tab:▸-,trail:⊡
set colorcolumn=80
set showmatch
set incsearch ignorecase smartcase
set noswapfile
set nowrap
set shiftwidth=4 softtabstop=4 tabstop=4 expandtab
set spelllang=en_us
set iskeyword+=-

filetype plugin on
autocmd FileType cpp setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
autocmd FileType vue, elm, javascript, typescript, css, scss, html setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab

" fzf
nnoremap <leader>p :Files<cr>
nnoremap <leader>o :GFiles<cr>
nnoremap <leader>c :GFiles?<cr>
nnoremap <leader>b :Buffers<cr>

" elm
let g:elm_setup_keybindings = 0

" netrw
command! E Explore
nnoremap <leader>ee :E<cr>
nnoremap <leader>er :Rexplore<cr>
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

" polygot
let g:polyglot_disabled = []

" ale
"let g:ale_completion_enabled = 1
nnoremap <leader>d :ALEGoToDefinition<cr>
nnoremap <leader>r :ALEFindReferences<cr>
nnoremap <leader>h :ALEHover<cr>

nnoremap <leader>fe :let g:ale_fix_on_save = 1<cr>
nnoremap <leader>fd :let g:ale_fix_on_save = 0<cr>
nnoremap <leader>ff :ALEFix<cr>

let g:ale_linters = {
\   'rust': ['rls'],
\   'java': ['javalsp'],
\}


let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'css': ['prettier'],
\   'scss': ['prettier'],
\   'html': ['prettier'],
\   'json': ['prettier'],
\   'vue': ['prettier'],
\   'rust' : ['rustfmt'],
\   'javascript': ['eslint', 'prettier'],
\   'typescript': ['eslint', 'tslint', 'prettier'],
\   'markdown': ['prettier'],
\   'python': ['black'],
\   'java': ['google_java_format']
\}

" emmet
let g:user_emmet_leader_key=','

" use system clipboard
set clipboard^=unnamed,unnamedplus

" coc settings
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
