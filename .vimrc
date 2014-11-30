" turn off auto adding comments on next line (for reliable paste)
" http://vimdoc.sourceforge.net/htmldoc/change.html#fo-table
set fo=tcq
set nocompatible
set modeline

syntax on

" cyan instead of darkblue
highlight comment ctermfg=cyan

highlight LiteralTabs ctermbg=darkgreen guibg=darkgreen
match LiteralTabs /\s\  /
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/

" show ruler
set ruler

" setup puppet manifest and spec options
au BufRead,BufNewFile *.pp
  \ set filetype=puppet
au BufRead,BufNewFile *_spec.rb
  \ nmap <F8> :!rspec --color %<CR>

" enable indentation for =>'s
filetype indent on

" use the OS clipboard by default
set clipboard=unnamed

" allow cursor keys in insert mode
set esckeys

" allow backspace in insert mode
set backspace=indent,eol,start

" enable mouse in all modes
set mouse=a

filetype plugin on
autocmd FileType go autocmd BufWritePre <buffer> Fmt
autocmd FileType puppet setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

" run golint when saving golang files
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow
