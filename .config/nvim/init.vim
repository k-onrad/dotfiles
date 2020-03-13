call plug#begin('~/.local/share/nvim/plugged')

Plug 'dylanaraps/wal.vim'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'dense-analysis/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'othree/html5.vim'
Plug  'Glench/Vim-Jinja2-Syntax'
Plug 'jvirtanen/vim-octave'
Plug 'evanleck/vim-svelte'
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim'

call plug#end()

" Use wal colorscheme
colorscheme wal

" Show line numbers
set number

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

" Use ALE as completion source
call deoplete#custom#option('sources', { '_': ['ale', 'jedi'] })

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

" Set auto pipenv
let g:ale_python_auto_pipenv = 1

" Set pynvim host
let g:python3_host_prog = '/home/bl4nk/.cache/virtualfish/nvim/bin/python'

" Flake8 ignore line length (E501)
let g:ale_python_flake8_options = "--ignore=E501"

" ALE linters
let g:ale_linters = {
\	'rust': ['rls'],
\	'javascript': ['standard', 'eslint'],
\	'python': ['flake8', 'mypy'],
\}

" ALE fixers
let g:ale_fixers = {
\   	'*': ['remove_trailing_lines', 'trim_whitespace'],
\   	'rust': ['rustfmt'],
\	'python': ['autopep8', 'black'],
\}
"	'javascript': ['standard', 'eslint'],

" Fix files on save
let g:ale_fix_on_save = 1

" Format errors messages
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Split below then right
set splitright|set splitbelow

" Svelte indentation
let g:svelte_indent_script = 0
let g:svelte_indent_style = 0
