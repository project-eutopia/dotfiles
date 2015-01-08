" This makes it so j and k move up and down, taking into account
" wrapped lines
noremap j gj
noremap k gk

" Adjust keywords to include underscore
set iskeyword+=_

" Highlight trailing space and whitespace on blank lines, but
" don't do so for space before cursor whilst typing in INSERT mode
" (ref: http://vim.wikia.com/wiki/Highlight_unwanted_spaces)
highlight ExtraWhitespace ctermbg=darkred guibg=darkred
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Remove trailing whitespace on save
" http://stackoverflow.com/questions/356126/how-can-you-automatically-remove-trailing-whitespace-in-vim
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
autocmd BufWritePre *.rb  :call TrimWhiteSpace()
autocmd BufWritePre *.tex :call TrimWhiteSpace()
autocmd BufWritePre *.bib :call TrimWhiteSpace()

" Configure CtrlP to include hidden files in search
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = ''

" No ag.vim message
let g:ag_mapping_message = 0
