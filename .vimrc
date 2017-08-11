" turn off auto adding comments on next line (for reliable paste)
" http://vimdoc.sourceforge.net/htmldoc/change.html#fo-table
exec pathogen#infect()
set fo=tcq
set nocompatible
set modeline
filetype plugin indent on
syntax on

" vim-go settings
let g:go_fmt_command = "goimports"
let g:go_metalinter_enabled = ['vet', 'golint']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']

" cyan instead of darkblue
highlight comment ctermfg=cyan

highlight LiteralTabs ctermbg=darkgreen guibg=darkgreen
match LiteralTabs /\s\  /
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/

" show ruler
set ruler

" use the OS clipboard by default
set clipboard=unnamed

" allow cursor keys in insert mode
set esckeys

" allow backspace in insert mode
set backspace=indent,eol,start

" enable mouse in all modes
set mouse=a

" better tab completion for tabnew
set wildmode=longest,list,full
set wildmenu

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 10
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

