" Line numbers
set number

" Default encoding
set encoding=utf-8

" 4 space tabs
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Auto-delete all trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Recognise files please thanks okay bye
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd BufRead,BufNewFile *.Rmd,*.rmd,*.md set filetype=markdown

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Compile document, be it groff/LaTeX/markdown/etc.
map <leader>c :w! \| !compiler <c-r>%<CR>
