:nnoremap <Leader>ll
      \ :w<CR>
      \ :! pdflatex -shell-escape '%:t'<CR>
      \ :! bibtex   '%:r'<CR>
      \ :! pdflatex -shell-escape '%:t'<CR>
      \ :! pdflatex -shell-escape '%:t'<CR>
      \ <CR>

so ~/.vim/ftplugin/tex_autoclose.vim
