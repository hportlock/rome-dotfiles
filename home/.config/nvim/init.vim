call plug#begin('~/.local/share/nvim/plugged')

" Bundles
" Let plugins repeat with the dot
Plug 'tpope/vim-repeat'

" Quick searching by hitting <Ctrl>-p
Plug 'ctrlpvim/ctrlp.vim'

" Comment out lines in source code quickly
Plug 'tComment'

" Run tests easily
Plug 'janko-m/vim-test'

" Async linting
Plug 'w0rp/ale'

" Syntax highlight coffee script
Plug 'kchmck/vim-coffee-script'

" Syntax highlight puppet
Plug 'rodjek/vim-puppet'

" Syntax highlight rabl
Plug 'yaymukund/vim-rabl'

" Syntax highlight todo.txt
Plug 'freitass/todo.txt-vim'

" Syntax highlight toml
Plug 'cespare/vim-toml'

" Syntax highlight jade
Plug 'digitaltoad/vim-pug'

" Syntax highlight javascript (required for jsx highlighting)
Plug 'pangloss/vim-javascript'

" Syntax highlight jsx
Plug 'mxw/vim-jsx'

" Golang support
Plug 'fatih/vim-go'

" Easily reformat SQL
Plug 'SQLUtilities'

" Extra stuff for rails development
Plug 'tpope/vim-rails'

" Better support for Angular
Plug 'burnettk/vim-angular'

" Support for text snippets
Plug 'SirVer/ultisnips'

" Plugin for making changing surrounding tags/punctuation easier
Plug 'tpope/vim-surround'

" Search and replace alter string case etc with ease
Plug 'tpope/vim-abolish'

" Shortcuts for jumping around etc
Plug 'tpope/vim-unimpaired'

" Change lines from single to multi quickly
Plug 'AndrewRadev/splitjoin.vim'

" Javascript auto importing
Plug 'galooshi/vim-import-js'

" Code completion in many languages
Plug 'valloric/youcompleteme'

" Insert quotes, parens etc in pairs
Plug 'jiangmiao/auto-pairs'

" Interface with database through vim
Plug 'vim-scripts/dbext.vim'

" Align on equal signs etc
Plug 'vim-scripts/Align'

" Use ctags easily
Plug 'ludovicchabant/vim-gutentags'

" Color Schemes
Plug 'tomasr/molokai'

" Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'lifepillar/vim-solarized8'

" Color Scheme better for vimdiff
Plug 'dhruvasagar/vim-railscasts-theme'

" Load all plugins
call plug#end()

" Map space to be the leader key
let mapleader = " "

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

" vim-test
"let g:rspec_command = ":Silent tmux select-window -t ih:2;tmux -q send-keys -t ih:2 \"dock rspec {spec}\" C-m"

function! DockerTransform(cmd) abort
  " return 'vagrant ssh --command '.shellescape('cd '.vagrant_project.'; '.a:cmd)
  return 'dock e w '.shellescape(a:cmd)
endfunction
let g:test#custom_transformations = {'docker': function('DockerTransform')}
let g:test#transformation = 'docker'
noremap <leader>s :TestNearest<CR>
noremap <leader>t :TestFile<CR>

" faith/vim-go - auto add go imports
let g:go_fmt_command = "goimports"

" Use different ale linters
let g:ale_linters = {
\  'javascript': ['eslint'],
\  'jsx': ['eslint'],
\}

" set jsx filetype so ale will pick it up
" augroup FiletypeGroup
"     autocmd!
"     au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
" augroup END

" Trigger configuration for ultisnips
let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<C-l>"
let g:UltiSnipsJumpBackwardTrigger="<C-h>"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
set runtimepath+=~/.vim
let g:UltiSnipsSnippetDirectories=["~/.vim/UltiSnips", "UltiSnips"]

" YouCompleteMe
" close the preview window after completion
let g:ycm_autoclose_preview_window_after_completion = 1

" splitjoin
" Don't add curly braces when splitting ruby keyword arguments
let g:splitjoin_ruby_curly_braces = 0
" Put html close bracket on a newline, added mainly for jsx
let g:splitjoin_html_attributes_bracket_on_new_line = 1

" SQLUtilities
let g:sqlutil_align_where = 0
let g:sqlutil_keyword_case = '\U'

" Gutentags workaround for
" https://github.com/ludovicchabant/vim-gutentags/issues/168
" TODO remove once the issue is fixed
au FileType gitcommit,gitrebase let g:gutentags_enabled=0


" End Bundle config

" Set the filetype for *.md files to be markdown
au BufRead,BufNewFile *.md set filetype=markdown

" Set the filetype for *.ruby files to be ruby
au BufRead,BufNewFile *.ruby set filetype=ruby

" Set the filetype for *.json.jbuilder to be ruby
au BufRead,BufNewFile *.json.jbuilder set filetype=ruby

" Set .babelrc files to be json
au BufRead,BufNewFile .babelrc set filetype=json

" Up the terminal speed
" set ttyscroll=1
" set ttyfast

" Set things up to use the Mac Clipboard
set clipboard+=unnamed

" Set up true colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" Set 256 colors in the terminal
" set t_Co=256

" Fix the broken mac binding
if has('mac') || has('macunix')
    nmap <esc>[A <up>
    nmap <esc>[B <down>
    nmap <esc>[C <right>
    nmap <esc>[D <left>
endif

"Higlight syntax
syntax on

" Solarized colors
set termguicolors
colorscheme solarized8_dark

if &diff
  colorscheme railscasts
endif
highlight IncSearch guibg=darkorange guifg=black
highlight SignColumn guibg=DarkSlateGray

" Make backspace work like normal
set backspace=2

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

" Easily print constants from docker ruby environment
autocmd FileType ruby nnoremap <leader>pp yiw:-tabnew \| call termopen("dock rails runner \"ap\\(".@"."\\)\"") \| startinsert<Enter>
