" Line numbers
set number relativenumber

" Auto-delete all trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e
