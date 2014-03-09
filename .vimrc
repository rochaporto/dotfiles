" turn off auto adding comments on next line (for reliable paste)
" http://vimdoc.sourceforge.net/htmldoc/change.html#fo-table
set fo=tcq
set nocompatible
set modeline

syntax on

" cyan instead of darkblue
highlight comment ctermfg=cyan

set tabstop=2
set expandtab
set softtabstop=2
set shiftwidth=2

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
filetype plugin indent on

" use the OS clipboard by default
set clipboard=unnamed

" allow cursor keys in insert mode
set esckeys

" allow backspace in insert mode
set backspace=indent,eol,start

" enable mouse in all modes
set mouse=a

