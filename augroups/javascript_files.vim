"===============================================================================
" Javascript specific stuff
"===============================================================================
augroup javascript_files

    au FileType javascript call JavaScriptFold()
    au FileType javascript set shiftwidth=4
    au FileType javascript set tabstop=4
    au FileType javascript set softtabstop=4
    " F10 = Save And Shift
    au FileType javascript noremap <F10> :w:!shifter
    au FileType javascript noremap! <F10> :w:!shifter

augroup END
