" =============================================================================
" vim configuration
" =============================================================================

" Behave more like vim and less like vi.
" This setting should be the first in the file
set nocompatible

syntax on
syntax enable


" Infect with pathojen early
" Pathogen lives in the autoload directory.
execute pathogen#infect()

" Something is causing this syntax plugin to run too late if called by pathogen.
source ~/.vim/bundle/vim-javascript-syntax/syntax/javascript.vim

" Enable filetype plugins
" Must be completed after the pathogen infection as some pathogen plugins
" use filetype plugins.
filetype plugin on

" Character listing configuration:
" * disable listing to start with; and
" * set the list of characters too.
set nolist
set listchars=tab:»·,trail:·

" We like a nice textwidth - 75 characters is good.
set textwidth=75

" We like fugitives configuration to be visible
set statusline +="%{fugitive#statusline()}"

" I like the ruler - it's good to see where we are!
set ruler

" TODO document this.
set backspace=2

" TODO document this.
set showcmd

" TODO document this.
set hidden

" Set tab completion to give a list
set wildmode=longest,list

"===============================================================================
" Indenting and tabs
"===============================================================================
" Indent each line the same as the last, unless it contains { or }
set smartindent

if v:version >= 600
    " Smart indent files according to type
    filetype indent on
endif

" Tab options - indents are 2 spaces
set softtabstop=2
" Expand tabs to spaces (set sanity)
set expandtab
" Indent automatically
set autoindent
" 2 spaces please
set tabstop=2
" Shift two spaces on tab too
set shiftwidth=2

"===============================================================================
" Session options
"===============================================================================
if v:version >= 600
    set sessionoptions=blank,buffers,curdir,folds,help,globals,options,winpos,resize,winsize,unix
    set viminfo='1000,f1,\"500,h
endif

" make >> work in sections
set shiftround

set matchpairs=<:>,{:},(:)

"===============================================================================
" Vim colours
"===============================================================================
highlight FoldColumn        ctermfg=black     ctermbg=grey    cterm=NONE
highlight FoldEd            ctermfg=green     ctermbg=NONE    cterm=NONE

"===============================================================================
" VimDiff colours
"===============================================================================

highlight DiffAdd           ctermfg=black      ctermbg=cyan    cterm=NONE
highlight DiffChange        ctermfg=black      ctermbg=blue    cterm=NONE
highlight DiffDelete        ctermfg=black      ctermbg=yellow  cterm=NONE
highlight DiffText          ctermfg=black      ctermbg=red     cterm=NONE

"===============================================================================
" Mappings and abbreviations
"===============================================================================

    " disable help and map F1 to toggle search highlights instead
    noremap <F1> :se hls!
    noremap! <F1> :se hls!

    " F2 = show / hide invisible characters
    noremap <F2> :se list!
    noremap! <F2> :se list!

    " F4 = show / hide invisible characters
    set pastetoggle=<F4>

    " F8 = open the file under the cursor in a new split.
    :map <F8> :vertical wincmd f<CR>

    " F10 = Save And Make
    noremap <F10> :w:make
    noremap! <F10> :w:make

    " F11 = Save
    noremap <F11> :w
    noremap! <F11> :w

    " F12 = Save And Exit
    noremap <F12> :wq
    noremap! <F12> :wq

    " Enter in normal mode inserts a blank line
    nnoremap <CR> o<ESC>

    " DEL in normal mode deletes the current line
    nnoremap <DEL> dd

    " Window resize shortcuts
    noremap <S-Up> +
    noremap <S-Down> -
    noremap <S-Left> <
    noremap <S-Right> >

    " Vim options
    ab vimstuff vim: shiftwidth=4:tabstop=8:smarttab

    " .vimrc options
    map ,v :sp ~/.vimmain<CR><C-W>_
    map <silent> ,V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimmain reloaded'"<CR>

"===============================================================================
" Commands
"===============================================================================
if has("user_commands")
    command! Bash set filetype=sh | normal gg!!which bashI#!
    command! Perl set filetype=perl | normal gg!!which perlI#!A -w
    command! Python set filetype=python | normal gg!!which pythonI#!
    command! Rehash source ~/.vimrc
endif

"===============================================================================
" Autocommands
"===============================================================================
if has("autocmd")

  " TODO erm..?
  autocmd!

  "=============================================================================
  " Filetype support
  "=============================================================================
  source ~/.vim/augroups/new_files.vim
  source ~/.vim/augroups/individual.vim
  source ~/.vim/augroups/html_files.vim
  source ~/.vim/augroups/perl_files.vim
  source ~/.vim/augroups/python_files.vim
  source ~/.vim/augroups/php_files.vim
  source ~/.vim/augroups/javascript_files.vim
  source ~/.vim/augroups/c_files.vim
  source ~/.vim/augroups/git.vim

endif
" end of autocommands

" Tagfiles support
" source ~/.vim/tagfiles.vim
" source ~/.vim/augroups/universal-priority.vim

source ~/.vim/lateconfig.vim
