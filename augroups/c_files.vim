"===============================================================================
" C specific stuff
"===============================================================================
augroup c_files

    au FileType c,cpp setl cindent
    au FileType c,cpp,lex ab subr /* **************************************** *\0C\* **************************************** */ka 

augroup END
