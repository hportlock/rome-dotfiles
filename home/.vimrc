set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Bundles
" Quick searching by hitting <Ctrl>-p
Bundle 'kien/ctrlp.vim'

" Comment out lines in source code quickly
Bundle "tComment"

" Run rspec tests easily
Bundle 'thoughtbot/vim-rspec'

" Extra syntax highlighting
Bundle 'scrooloose/syntastic'

" Syntax highlight coffee script
Bundle 'kchmck/vim-coffee-script'

" Syntax highlight puppet
Bundle 'rodjek/vim-puppet'

" Syntax highlight rabl
Bundle 'yaymukund/vim-rabl'

" Easily reformat SQL
Bundle 'SQLUtilities'

" Extra stuff for rails development
Bundle 'tpope/vim-rails'

" Color Scheme
Bundle 'tomasr/molokai'

" Map comma to be the leader key
let mapleader = ","

" Define Silent to automatically redraw the screen
command! -nargs=1 Silent
      \ | execute ':silent !'.<q-args>
      \ | execute ':redraw!'

" Bundle config
"
" tComment - Use // to comment out lines
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

" thoughtbot/vim-rspec
let g:rspec_command = ":Silent tmux select-window -t human-3:2;tmux -q send-keys -t human:2 \"zeus rspec {spec}\" C-m"
noremap <leader>a :call RunCurrentSpecFile()<CR>
noremap <leader>s :call RunNearestSpec()<CR>

filetype plugin indent on

" Set the filetype for *.md files to be markdown
au BufRead,BufNewFile *.md set filetype=markdown

" Up the terminal speed
set ttyscroll=1
set ttyfast
" set scrolljump=20

" Set things up to use the Mac Clipboard
" unless we're using tmux
if $TMUX == ''
  set clipboard+=unnamed
endif

" Set 256 colors in the terminal
set t_Co=256

" Fix the broken mac binding
if has('mac') || has('macunix')
    nmap <esc>[A <up>
    nmap <esc>[B <down>
    nmap <esc>[C <right>
    nmap <esc>[D <left>
endif

let g:molokai_original = 1
colorscheme molokai

" Make backspace work like normal
set backspace=2

"Higlight syntax
syntax on

"Highlight tabs and trailing spaces
set list listchars=tab:>-,trail:.,extends:>

"Make it known whether the line length is greater than 79 characters
if exists('+colorcolumn')
    highlight ColorColumn ctermbg=darkgray guibg=#302226
    set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

"Don't sandbox local vimrcs and ask about them, but let the whitelist persist
"if answered with a capital Y
" let g:localvimrc_ask = 1
" let g:localvimrc_persistent = 1
" let g:localvimrc_sandbox = 0

"Setup viminfo to store variables too with the !
set viminfo='100,<50,s10,h,!

set autoindent
set tags=/Users/rome/tags

" Make line navigation ignore line wrap
onoremap <Up> gk
nnoremap <Up> gk
onoremap <Down> gj
nnoremap <Down> gj

" Switch to previous file with <leader><leader>
nnoremap <leader><leader> <c-^>

" Dvorak it!
"no d h
"no h j
"no t k
"no n l
"no s :
"no S :
"no j d
"no l n
"no L N
" Added benefits
"no - $
" _ is already almost a synonym for ^, so use this but no need to remap
"no N <C-w><C-w>
"no T <C-w><C-r>
"no H 8<Down>
"no T 8<Up>
"no D <C-w><C-r>

" Map control-r to be a visual find-replace
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

"Close a buffer without closing split with <leader>c
nnoremap <leader>c :bp\|bd #<CR>

" Setup a more useful status line
set statusline=%F%m%r%h%w\ [%{&ff}]\ [LN=%04l][%p%%]
set laststatus=2
set ts=2
set sw=2
set et
set softtabstop=2

" Filetype specific settings
autocmd FileType java setlocal ts=4
autocmd FileType java setlocal sw=4

" SSH in and touch files when the are saved on vagrant
if !exists("ssh_touch_auto_command")
  let ssh_touch_auto_command = 1
  autocmd BufWritePost /Users/rome/work/alivecor_vm/project/hum-webapp/* silent execute '!ssh -q romedev "touch -c ~/project/hum-webapp/% 2>/dev/null"'
endif
