" plugins
exec pathogen#infect()
set fo=tcq
set modeline
set nocompatible 		" vim improved
filetype off
filetype plugin indent on

"call plug#begin()
"Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
"call plug#end()

" general settings
set noerrorbells	" mute beeps
set number			" line numbers
set backspace=indent,eol,start	" consistent behavior for backspace
set showcmd			" show partial cmds
set showmode		" always show current mode
set noswapfile
set nobackup		" not really used
set nowritebackup
set splitright		" better split modes
set splitbelow
set encoding=utf-8	" enforce encoding
set autowrite
set laststatus=2	" show status line
set ruler			" always show cursor position
set incsearch		" show search match while typing
set hlsearch		" highlight search matches
set ignorecase		" case insensitive search
set smartcase		" ... unless uppercase
set ttyfast
set lazyredraw

set nocursorcolumn	" faster syntax highlight
set nocursorline
syntax sync minlines=256
set synmaxcol=300
set re=1

" vertical help
command! -nargs=* -complete=help Help vertical belowright help <args>
autocmd FileType help wincmd L

set wrap linebreak nolist columns=80 " soft wrap at 80 cols (visual wrap only)

set autoindent          " improved indent
set complete-=i
set showmatch
set smarttab
set et
set tabstop=4
set shiftwidth=4
set expandtab

set nrformats-=octal
set shiftround

set clipboard=unnamed " use os clipboard by default

set esckeys " allow cursor keys in insert mode

set mouse=a " enable mouse in all modes

set wildmode=longest,list,full " improved tabnew completion
set wildmenu

syntax enable
if has('gui_running')
  set transparency=3
  " fix js regex syntax
  set regexpengine=1
  syntax enable
endif
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized
set guifont=Inconsolata\ 10
set guioptions-=L


" mappings
nnoremap <leader><space> :nohlsearch<CR> " clear search


" file types

au BufNewFile,BufRead *.vim setlocal noet ts=4 sw=4 sts=4
au BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4
au BufNewFile,BufRead *.md setlocal spell noet ts=4 sw=4
au BufNewFile,BufRead *.yml,*.yaml setlocal expandtab ts=2 sw=2
au BufNewFile,BufRead *.cpp setlocal expandtab ts=2 sw=2
au BufNewFile,BufRead *.hpp setlocal expandtab ts=2 sw=2
au BufNewFile,BufRead *.json setlocal expandtab ts=2 sw=2
au BufNewFile,BufRead *.jade setlocal expandtab ts=2 sw=2

" go
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
let g:go_fmt_fail_silently = 0
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_term_enabled = 1
let g:go_snippet_engine = "neosnippet"
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_operators = 0
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 1
au FileType go nmap <Leader>s <Plug>(go-def-split)
au FileType go nmap <Leader>v <Plug>(go-def-vertical)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>l <Plug>(go-metalinter)
au FileType go nmap <leader>r  <Plug>(go-run)
au FileType go nmap <leader>b  <Plug>(go-build)
au FileType go nmap <leader>t  <Plug>(go-test)
au FileType go nmap <leader>dt  <Plug>(go-test-compile)
au FileType go nmap <Leader>d <Plug>(go-doc)
au FileType go nmap <Leader>e <Plug>(go-rename)

" markdown
autocmd BufNewFile,BufReadPost *.md setl ts=4 sw=4 sts=4 expandtab
" dockerfile
autocmd FileType dockerfile set noexpandtab
" shell/config/systemd
autocmd FileType fstab,systemd set noexpandtab
autocmd FileType gitconfig,sh,toml set noexpandtab
" python
autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=80 smarttab expandtab
" toml
au BufRead,BufNewFile MAINTAINERS set ft=toml
" git
autocmd FileType gitcommit setlocal spell " spell check
" json
let g:vim_json_syntax_conceal = 0

" Wildmenu completion {{{
set wildmenu
" set wildmode=list:longest
set wildmode=list:full
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=migrations                       " Django migrations
set wildignore+=go/pkg                           " Go static files
set wildignore+=go/bin                           " Go bin files
set wildignore+=go/bin-vagrant                   " Go bin-vagrant files
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files

" =================== vim-airline ========================

let g:airline_theme='solarized'

" set to use powerline fonts when not in a ssh session
let g:remoteSession = ($STY == "")
if !g:remoteSession
  let g:airline_powerline_fonts=1
endif

" quickfix
map <C-n> :cn<CR>
map <C-m> :cp<CR>
nnoremap <leader>a :cclose<CR>

" vim:ts=2:sw=2:et
