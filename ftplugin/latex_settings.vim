:nnoremap <Leader>ll
      \ :w<CR>
      \ :! pdflatex '%:t'<CR>
      \ :! bibtex   '%:r'<CR>
      \ :! pdflatex '%:t'<CR>
      \ :! pdflatex '%:t'<CR>
      \ <CR>
