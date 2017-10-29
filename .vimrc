set nocompatible

" Vim-Plug installation--------------------
if !filereadable(expand('~\vimfiles\autoload\plug.vim')) && !filereadable(expand('~/.vim/autoload/plug.vim'))
  echo "Installing Vim-Plug..."
  echo ""
  if has('win32') || has('win32unix') || has('win64') || has('win16')
    silent !md ~\vimfiles\autoload
    silent !$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    silent !(New-Object Net.WebClient).DownloadFile($uri, $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath("~\vimfiles\autoload\plug.vim"))
  elseif has('macunix') || has('unix')
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  endif
  echo "Vim-Plug install completed."
endif
" End Vim-Plug installation----------------

call plug#begin('~/.vim/plugged')
Plug 'lifepillar/vim-mucomplete'
Plug 'rip-rip/clang_complete'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'airblade/vim-rooter'
Plug 'tomtom/tcomment_vim'
Plug 'flazz/vim-colorschemes'
Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

" General remappings
inoremap jj <Esc>`^
noremap j h
noremap k j
noremap l k
noremap ; l
:command WQ wq
:command Wq wq
:command W w
:command Q q
nnoremap <C-J> <C-W><C-H>
nnoremap <C-K> <C-W><C-J>
nnoremap <C-L> <C-W><C-K>
nnoremap <C-;> <C-w><C-L>

" Custom settings
set scrolloff=2
set number
set showmode
set showcmd
set ruler
set tabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set incsearch
set nobackup
set splitbelow
set splitright
set backspace=indent,eol,start " backspace over everything in insert mode
set laststatus=2 " Enable status line

" Colorscheme settings
colorscheme gruvbox
set background=dark

" MUcomplete settings
set completeopt+=menuone
inoremap <expr> <c-e> mucomplete#popup_exit("\<c-e>")
inoremap <expr> <c-y> mucomplete#popup_exit("\<c-y>")
inoremap <expr>  <cr> mucomplete#popup_exit("\<cr>")
let g:mucomplete#enable_auto_at_startup = 1
set completeopt+=noselect
set completeopt+=noinsert

" clang_complete settings
let g:clang_library_path='/usr/lib/llvm-4.0/lib' " This must change to reflect proper clang lib
let g:clang_user_options = '-std=c++17'
let g:clang_complete_auto = 1

" javacomplete2 settings
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" ALE settings
let g:ale_sign_column_always = 1

" NERDTree settings
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | e    xe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree    ()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
