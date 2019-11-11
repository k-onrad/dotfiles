call plug#begin('~/.local/share/nvim/plugged')

Plug 'dylanaraps/wal.vim'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'dense-analysis/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'psf/black'

call plug#end()

" Use wal colorscheme
colorscheme wal

" Show line numbers
set number

" Remap splits keybindings
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j
nnoremap <silent> <C-S-Right> <c-W>l
nnoremap <silent> <C-S-Left> <c-W>h
nnoremap <silent> <C-S-Up> <c-W>k
nnoremap <silent> <C-S-Down> <c-W>j

" Use ALE as completion source
call deoplete#custom#option('sources', { '_': ['ale'] })

" ALE linters
let g:ale_linters = {
\	'rust': ['rls'],
\	'javascript': ['standard'],
\	'python': ['pycodestyle'],
\}

" ALE fixers
let g:ale_fixers = {
\   	'*': ['remove_trailing_lines', 'trim_whitespace'],
\   	'rust': ['rustfmt'],
\	'javascript': ['standard'],
\	'python': ['black'],
\}

" Use pipenv linters
let g:ale_python_auto_pipenv = 1

" Fix files on save
let g:ale_fix_on_save = 1

" Don't point errors until saving
" let g:ale_lint_on_text_changed = 'never'

" Start deoplete
let g:deoplete#enable_at_startup = 1

" Continue indenting
set autoindent

" Split below then right
set splitright|set splitbelow
