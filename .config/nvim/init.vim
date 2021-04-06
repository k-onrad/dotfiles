if !exists('g:vscode')
  "if empty(glob('~/.vim/autoload/plug.vim'))
  "  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
  "    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  "endif

  call plug#begin('~/.local/share/nvim/plugged')

  Plug 'junegunn/fzf', { 'do': './install --bin' }
  Plug 'dyng/ctrlsf.vim'
  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'leafOfTree/vim-svelte-plugin'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'Quramy/vim-js-pretty-template'
  Plug 'jparise/vim-graphql'
  Plug 'rescript-lang/vim-rescript'
  Plug 'neovimhaskell/haskell-vim'
  Plug 'sdiehl/vim-ormolu'

  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'jiangmiao/auto-pairs'

  Plug 'dylanaraps/wal.vim'
  Plug 'whatyouhide/vim-gotham'
  Plug 'rainglow/vim'

  call plug#end()

  " Kitty work-around
  let &t_ut=''

  " CoC stuff
  set hidden

  " Use true colors
  set termguicolors

  " Use colorscheme
  colorscheme gotham

  " Show line numbers
  set number

  " Basic syntax shit
  syntax on
  filetype on
  filetype plugin indent on

  " Remap splits keybindings
  nnoremap <silent> <C-Right> <c-w>l
  nnoremap <silent> <C-Left> <c-w>h
  nnoremap <silent> <C-Up> <c-w>k
  nnoremap <silent> <C-Down> <c-w>j
  nnoremap <silent> <C-S-Right> <c-W>l
  nnoremap <silent> <C-S-Left> <c-W>h
  nnoremap <silent> <C-S-Up> <c-W>k
  nnoremap <silent> <C-S-Down> <c-W>j

  " Map searches
  nnoremap <c-p> :FZF<Enter>
  nnoremap <c-f> :CtrlSF<Space>
  map <C-n> :NERDTreeToggle<CR>

  " Close NerdTree if its last buffer open
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  let g:NERDTreeWinPos = "right"

  let g:vim_svelte_plugin_load_full_syntax = 1

  " show existing tab with 2 spaces width
  set tabstop=2
  " when indenting with '>', use 2 spaces width
  set shiftwidth=2
  " On pressing tab, insert 2 spaces
  set expandtab
  " Split below then right
  set splitright|set splitbelow

  " Use K to show documentation in preview window.
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Some servers have issues with backup files, see #649.
  set nobackup
  set nowritebackup

  " Give more space for displaying messages.
  set cmdheight=2

  " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
  " delays and poor user experience.
  set updatetime=200

  " Don't pass messages to |ins-completion-menu|.
  set shortmess+=c

  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')
endif
