" Some great resources:
" https://www.youtube.com/watch?v=XA2WjJbmmoM
" https://github.com/changemewtf/no_plugins/blob/master/no_plugins.vim
" https://www.youtube.com/watch?v=OnUiHLYZgaA&t=887s
"

" Yea... no thanks
set nocompatible

" Basics...
syntax enable
set number
set relativenumber

" built-in netrw
filetype plugin on


" Tab completion for finding all files in sub folders
set path+=**

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=2  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
let g:netrw_winsize = 25

" Better menu on fuzy searching
set wildmenu


" Tag C-Tag maker for root directory
command! MakeTags !ctags -R .

" Be Better with spaces instead of tabs (Most of the time):
" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Use filetype detection and file-based automatic indenting.
  filetype plugin indent on

  " Use actual tab chars in Makefiles.
  autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
endif

" For everything else, use a tab width of 3 space chars.
set tabstop=2       " The width of a TAB is set to 3.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 3.
set shiftwidth=2    " Indents will have a width of 3.
set softtabstop=2   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces.


" Plugins!!!!

" Install Plug if its not already there
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" General Plugs

" Color scheme
Plug 'flazz/vim-colorschemes'

" Lightline
Plug 'itchyny/lightline.vim'
set laststatus=2
let g:lightline = { 'colorscheme': 'seoul256' }

" Nerd tree stuff
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" autocmd vimenter * NERDTree
"
" CtrlP
Plug 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Multiple Cursors
Plug 'terryma/vim-multiple-cursors'

" GitGutter
Plug 'airblade/vim-gitgutter'

" Fugitive
Plug 'tpope/vim-fugitive'

" Elixir Stuff
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'
let g:mix_format_on_save = 1

call plug#end()


" Color change needs to happen after plug
colorscheme dracula
