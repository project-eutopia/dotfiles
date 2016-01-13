" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2011 Apr 15
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Don't use swap files (with the ~ at the end)
set noswapfile

" Use spaces in place of tabs, and prefer 2 space size tabs
set smarttab
set expandtab
set tabstop=4
set shiftwidth=2

" Ignore cases in searches
set smartcase
set ignorecase

" To move between windows easily
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

" Remap the next and previous chunk hotkeys for GitGutter
" nmap ]h <Plug>GitGutterNextHunk
" nmap [h <Plug>GitGutterPrevHunk

" Easier way to escape out of visual or insert mode
vnoremap ;; <Esc>
inoremap ;; <Esc>

" Return will insert newline at cursor
nnoremap <CR> i<CR><Esc>==^

set nobackup		" do not keep a backup file
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set number              " display line numbers on left side
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set scrolloff=3         " keep 3 line above/below cursor

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

:set statusline=%<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P

execute pathogen#infect()
Helptags

" Solarized colorscheme settings
syntax enable
set background=dark
set term=screen-256color
let g:solarized_termcolors=256
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
colorscheme solarized

" vim-markdown customization
let g:vim_markdown_folding_disabled=1

" Custom trailing whitespace handling
so ~/.vim/settings.vim

" Automatically close vim if NERDTree is the last open window
" (ref: github.com/scrooloose/nerdtree)
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Highlight the 120 character limit
set colorcolumn=120
hi ColorColumn ctermfg=NONE ctermbg=17 cterm=NONE guifg=NONE guibg=#112c34 gui=NONE

let g:vimrubocop_config = '/home/chris/.vim/rubocop_style_guide_ruby.yml'

set diffopt+=vertical

" Open as a zip file appropriate files
" See: http://stackoverflow.com/questions/22387836/open-a-docx-file-as-a-zip-in-vim
au BufReadCmd *.jar,*.xpi,*.docx,*.odp,*.ods,*.odt call zip#Browse(expand("<amatch>"))

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" https://github.com/bling/vim-airline/wiki/FAQ
" https://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
