set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()


" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Bundles
" Quick searching by hitting <Ctrl>-p
Bundle 'ctrlpvim/ctrlp.vim'

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

" Syntax highlight todo.txt
Bundle 'freitass/todo.txt-vim'

" Syntax highlight toml
Bundle 'cespare/vim-toml'

" Syntax highlight jade
Plugin 'digitaltoad/vim-pug'

" Syntax highlight javascript (required for jsx highlighting)
Plugin 'pangloss/vim-javascript'

" Syntax highlight jsx
Plugin 'mxw/vim-jsx'

" Golang support
Bundle 'fatih/vim-go'

" Easily reformat SQL
Bundle 'SQLUtilities'

" Extra stuff for rails development
Bundle 'tpope/vim-rails'

" Better support for Angular
Plugin 'burnettk/vim-angular'

" Support for text snippets
Plugin 'SirVer/ultisnips'

" Predefined snippets
Plugin 'honza/vim-snippets'

" Color Schemes
Bundle 'tomasr/molokai'
Bundle 'altercation/vim-colors-solarized'

" Color Scheme better for vimdiff
Bundle 'dhruvasagar/vim-railscasts-theme'

" Load all plugins
call vundle#end()

" Map comma to be the leader key
let mapleader = ","

" Define Silent to automatically redraw the screen
command! -nargs=1 Silent
      \ | execute ':silent !'.<q-args>
      \ | execute ':redraw!'

" Bundle config
"
" ctrlp
" ignore platforms directories
let g:ctrlp_custom_ignore = {
 \ 'dir': '\v[\/]platforms$|[\/]tmp$',
 \ }
" ignore stuff in .gitignore
let g:ctrlp_user_command = [
\ '.git/',
\ 'git --git-dir=%s/.git ls-files -oc --exclude-standard'
\ ]
" use version control files to set the working directory
let g:ctrlp_working_path_mode = 'ra'

" tComment - Use // to comment out lines
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

" thoughtbot/vim-rspec
let g:rspec_command = ":Silent tmux select-window -t ll-1:4;tmux -q send-keys -t ll:4 \"bin/rspec {spec}\" C-m"
noremap <leader>a :call RunCurrentSpecFile()<CR>
noremap <leader>s :call RunNearestSpec()<CR>

" faith/vim-go - auto add go imports
let g:go_fmt_command = "goimports"

" Allow for ionic html attributes in syntastic
"allow for ionic html attributes
let g:syntastic_html_tidy_blocklevel_tags = [
  \'ion-checkbox',
  \'ion-content',
  \'ion-delete-button',
  \'ion-footer-bar',
  \'ion-header-bar',
  \'ion-infinite-scroll',
  \'ion-item',
  \'ion-list',
  \'ion-modal-view',
  \'ion-nav-back-button',
  \'ion-nav-bar',
  \'ion-nav-buttons',
  \'ion-nav-view',
  \'ion-option-button',
  \'ion-pane',
  \'ion-popover-view',
  \'ion-radio',
  \'ion-refresher',
  \'ion-reorder-button',
  \'ion-scroll',
  \'ion-side-menu',
  \'ion-side-menus',
  \'ion-side-menu-content',
  \'ion-slide',
  \'ion-slide-box',
  \'ion-tab',
  \'ion-tabs',
  \'ion-toggle',
  \'ion-view',
  \]

" Turn syntax checking off for html to support angular templates
let g:syntastic_mode_map={ 'mode': 'active',
                    \ 'active_filetypes': [],
                    \ 'passive_filetypes': ['html'] }

" Change syntastic js checker mainly to support reactjs
let g:syntastic_javascript_checkers = ['eslint']

" Let syntastic populate the location list
let g:syntastic_always_populate_loc_list = 1

" Trigger configuration for ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"

" End Bundle config

filetype plugin indent on

" Set the filetype for *.md files to be markdown
au BufRead,BufNewFile *.md set filetype=markdown

" Set the filetype for *.ruby files to be ruby
au BufRead,BufNewFile *.ruby set filetype=ruby

" Set the filetype for *.json.jbuilder to be ruby
au BufRead,BufNewFile *.json.jbuilder set filetype=ruby

" Set .babelrc files to be json
au BufRead,BufNewFile .babelrc set filetype=json

" Up the terminal speed
set ttyscroll=1
set ttyfast
" set scrolljump=20

" Set things up to use the Mac Clipboard
set clipboard+=unnamed

" Set 256 colors in the terminal
set t_Co=256

" Fix the broken mac binding
if has('mac') || has('macunix')
    nmap <esc>[A <up>
    nmap <esc>[B <down>
    nmap <esc>[C <right>
    nmap <esc>[D <left>
endif

" Solarized colors
set term=xterm-256color
syntax enable
set background=dark
colorscheme solarized

if &diff
  colorscheme railscasts
endif

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
  autocmd BufWritePost /Users/rome/project/haven/project/chosen-webapp/* silent execute '!ssh -q havenvm "touch -c ~/project/chosen-webapp/% 2>/dev/null"'
  autocmd BufWritePost /Users/rome/project/haven/project/haven-webapp/* silent execute '!ssh -q havenvm "touch -c ~/project/haven-webapp/% 2>/dev/null"'
  autocmd BufWritePost /Users/rome/project/haven/project/admin-chosen/* silent execute '!ssh -q havenvm "touch -c ~/project/admin-chosen/% 2>/dev/null"'
endif
