" Vim resources:
" http://tammersaleh.com/posts/the-modern-vim-config-with-pathogen
" http://www.adamlowe.me/2009/12/vim-destroys-all-other-rails-editors.html

set nocompatible                  " Must come first because it changes other options.

filetype off                      " Needed on some linux distros.

silent! call pathogen#helptags() 
silent! call pathogen#runtime_append_all_bundles()

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plugin.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set timeoutlen=500                " Wait half-second for additional keys

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

" Softtabs, two spaces
set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs
set list listchars=tab:»·,trail:·" Display extra whitespace

set laststatus=2                  " Show the status line all the time
nmap <C-q> :quit

" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Ignore certian filetypes and directories
set wildignore+=*.o,*.obj,*.pyc,*.DS_STORE,*.db,*.swc,*.tar,*.tgz,.git,public_html/images/**,public_html/upload/**,var/**,*/uploads/**,*/pear/**

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
endif

" Or use vividchalk, molakai, github
colorscheme ir_black

" Comma is the leader character
let mapleader = ","

" Launch vimrc with ,v and automatically load changes on write
autocmd bufwritepost .vimrc source $MYVIMRC
nmap <leader>v :edit $MYVIMRC<CR>

" ,w to save
nmap <leader>w :w<CR>

" ,q to quit (close window)
nmap <leader>q :quit<CR>
nmap <leader>qq :quitall<CR>

" ,wq or ,qw to write and quit
nmap <leader>wq :wq<CR>
nmap <leader>qw :wq<CR>

" Smart way to move between windows. Ctrl-[h,j,k,l]
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" If in Visual Mode, resize window instead of changing focus. Ctrl-[h,j,k,l] 
vmap <C-j> <C-W>+
vmap <C-k> <C-W>-
vmap <C-h> <C-W><
vmap <C-l> <C-W>>

" Actually move current window
nmap <leader>j <C-W><S-j>
nmap <leader>k <C-W><S-k>
nmap <leader>h <C-W><S-h>
nmap <leader>l <C-W><S-l>

" 0 is beginning of line, so make - the end of the line
nmap - $

" u is undo, so make ctrl-u redo
nmap <C-u> <C-R>

" Visual mode insert and after, make lower-case work
vmap i <S-i>
vmap a <S-a>

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<CR>
" Move to the next misspelled word
map <leader>sn ]s
" Move to the previous misspelled word
map <leader>sp [s
" Add word to dictionary
map <leader>sa zg
" View spelling suggestions for misspelled word
map <leader>s? z=

" Focus MiniBufExplorer tabs and cycle with comma-tab (,Tab -> tab, tab, tab...)
nmap <leader><tab> :MiniBufExplorer<CR>

" Alt-tab between buffers with comma-comma-tab (,,Tab)
nmap <leader>6 <C-^>
nmap <leader>^ <C-^>

" NERDTree shortcut ,d 
map <leader>d :NERDTreeToggle<CR>
map <leader>dd :NERDTreeClose<CR>:NERDTreeFind<CR>

" Tab mappings.
map <leader>tn :tabnew %<CR>
map <leader>te :tabedit
map <leader>tc :tabclose<CR>
map <leader>tm :tabmove

" Visual shifting (builtin-repeat)
vnoremap < <gv
vnoremap > >gv

" F5 will remove trailing whitespace and tabs
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby setlocal foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
autocmd BufNewFile,BufRead *_spec.rb compiler rspec

" Start new session with NERDTree opened
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
