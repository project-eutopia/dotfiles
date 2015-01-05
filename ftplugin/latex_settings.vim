:nnoremap <Leader>ll
      \ :w<CR>
      \ :! pdflatex '%:t'<CR>
      \ :! biber    '%:r'<CR>
      \ :! pdflatex '%:t'<CR>
      \ :! pdflatex '%:t'<CR>
      \ <CR>
