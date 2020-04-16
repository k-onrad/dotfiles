call plug#begin('~/.local/share/nvim/plugged')

" Core
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale'

Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'racer-rust/vim-racer'

Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'maxmellon/vim-jsx-pretty'
Plug 'ianks/vim-tsx'
Plug 'leafOfTree/vim-svelte-plugin'

Plug 'dylanaraps/wal.vim'
Plug 'vim-airline/vim-airline'

Plug 'jiangmiao/auto-pairs'
Plug 'othree/html5.vim'
Plug  'Glench/Vim-Jinja2-Syntax'
Plug 'jvirtanen/vim-octave'

call plug#end()

" Use wal colorscheme
colorscheme wal

" Show line numbers
set number

" Set hidden mode for buffers
set hidden

" Mapping fzf to ctrl+p
nnoremap <C-p> :FZF <CR>

" Mapping ctrlsf to ctrl+f
nnoremap <C-f> :CtrlSF<Space>

" Remap splits keybindings
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j
nnoremap <silent> <C-S-Right> <c-W>l
nnoremap <silent> <C-S-Left> <c-W>h
nnoremap <silent> <C-S-Up> <c-W>k
nnoremap <silent> <C-S-Down> <c-W>j

" Config tabs with spaces
set expandtab
set shiftwidth=2
set softtabstop=2

" Set deoplete runtime path
set runtimepath+=~/.local/share/nvim/plugged/deoplete.nvim/

" Start deoplete
let g:deoplete#enable_at_startup = 1

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

" Rust completions with complete signature
let g:racer_experimental_completer = 1
" Set auto pipenv
" let g:ale_python_auto_pipenv = 1

" Set pynvim host
let g:python3_host_prog = '/home/bl4nk/.cache/virtualfish/nvim/bin/python'

" Turn off ALE autocompletion
let g:ale_completion_enabled = 0

" ALE linters
let g:ale_linters = {
\	'rust': ['rls'],
\	'javascript': ['eslint', 'tsserver'],
\       'typescript': ['eslint','tsserver'],
\       'svelte': ['eslint', 'tsserver'],
\	'python': ['flake8', 'mypy'],
\}

" ALE fixers
let g:ale_fixers = {
\   	'*': ['remove_trailing_lines', 'trim_whitespace'],
\   	'rust': ['rustfmt'],
\       'javascript': ['eslint'],
\       'typescript': ['eslint'],
\       'svelte': ['eslint'],
\	'python': ['black', 'autopep8'],
\}

" Set ale to use global executables
" let g:ale_use_global_executables = 1

" Fix files on save
let g:ale_fix_on_save = 1

" Format errors messages
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Split below then right
set splitright|set splitbelow

" Svelte indentation
" let g:svelte_indent_script = 0
" let g:svelte_indent_style = 0
let g:vim_svelte_plugin_load_full_syntax = 1

" gitgutter icons
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'

" let tsserver lint javascript
let g:nvim_typescript#javascript_support = 1
