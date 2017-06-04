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
call plug#end()

inoremap jj <Esc>`^
set backspace=indent,eol,start " backspace over everything in insert mode
noremap j h
noremap k j
noremap l k
noremap ; l
:command WQ wq
:command Wq wq
:command W w
:command Q q

set laststatus=2
