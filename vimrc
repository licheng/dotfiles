" vim: set foldmarker={,} foldlevel=0 foldmethod=marker:

" Basic Settings {
set nocompatible
"set term=xterm
set t_Co=256
set wildmode=longest,list,full
set wildmenu
" }

" Vundle Settings {
" To Install Vundle:
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" vim +BundleInstall +qall
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
" Custom Plugins {
Bundle 'Smart-Home-Key'
Bundle 'SingleCompile'
Bundle 'FencView.vim'
Bundle 'bufexplorer.zip'
Bundle 'a.vim'
Bundle 'tpope/vim-rails'
Bundle 'estin/htmljinja'
Bundle 'Cpp11-Syntax-Support'
Bundle 'jdevera/vim-protobuf-syntax.git'
Bundle 'LargeFile'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-surround'
Bundle 'kien/ctrlp.vim'
Bundle 'godlygeek/tabular'
Bundle 'altercation/vim-colors-solarized'
Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
" }
filetype plugin indent on
" }

" File related {
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set autochdir
set hidden
set undodir=~/.vim/undodir/
set undofile
set tags+=tags;
set grepprg=grep\ -nH\ $*
set shellslash
" }

" UI related {
set ruler
set showmatch
set hlsearch
set linebreak
set number
set visualbell
set cursorcolumn
set cursorline
set mouse=a
set mousemodel=popup
"colo darkmate
colo solarized
let g:solarized_termcolors=256
let g:solarized_menu=0
set background=dark
if (has("gui_running"))
    if has('mac')
        set guioptions=egrL guifont=Monaco:h12 lines=40 columns=80 nowrap
    elseif has('unix')
        set guioptions=egrL guifont=Inconsolata\ 13 lines=40 columns=80 nowrap
    endif
else
    set wrap
endif
" }

" Edit related {
set backspace=indent,eol,start
set whichwrap=b,s,<,>,[,]
set selectmode=
set selection=exclusive
set keymodel=startsel,stopsel
map <C-c> "+y<CR>
map! <C-v> <C-r>+
" }

" Syntax related {
syntax on
let g:load_doxygen_syntax=1
set tabstop=4 shiftwidth=4
set colorcolumn=80
set smarttab
set expandtab
set cindent cinoptions=:0g0t0(2susj1N-s
set autoindent
set linebreak ambiwidth=double
set formatoptions+=mB
" }

" Plugin: Smart-Home {
nmap <silent> <Home> :SmartHomeKey <CR>
imap <silent> <Home> <C-O>:SmartHomeKey<CR>
" }

" Plugin: SingleCompile {
let common_run_command = './$(FILE_TITLE)$'
call SingleCompile#SetCompilerTemplate('c', 'gcc', 'GNU C Compiler',
                \'gcc', '-g -Wall -o $(FILE_TITLE)$', common_run_command)
call SingleCompile#SetCompilerTemplate('cpp', 'g++',
                \'GNU C++ Compiler', 'g++', '-g -Wall -o $(FILE_TITLE)$',
                \common_run_command)
nmap <F9> :SCCompile<cr>:cw<cr>
nmap <F10> :SCCompileRun<cr> 
" }

" Plugin: Buf Explorer {
map <F2>    :BufExplorer<CR>
" }

" Plugin: VIM-Latex {
let g:tex_flavor = 'xetex'
let g:Tex_FormatDependency_pdf = 'pdf'
let g:Tex_CompileRule_pdf = 'xelatex -output-directory=build $*'
let g:Tex_DefaultTargetFormat = 'pdf'
if has('mac')
    let g:Tex_ViewRule_pdf = 'open'
elseif has('unix')
    let g:Tex_ViewRule_pdf = 'okular'
endif
let g:Tex_FoldedEnvironments = 'verbatim,comment,eq,gather,align,figure,table,thebibliography,keywords,abstract,titlepage,frame'

" }

" Plugin: Cpp11-Syntax-Support {
let g:load_doxygen_syntax=1
au BufNewFile,BufRead *.cpp set syntax=cpp11
au BufNewFile,BufRead *.hpp set syntax=cpp11
" }

" Plugin: vim-powerline {
set laststatus=2
" }

" Plugin: ctrlp {
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_regexp = 1
let g:ctrlp_custom_ignore = 'build$\|doc$\|.git$\|.svn$'
" }

" Plugin: LargeFile {
let g:LargeFile = 1
" }

" Plugin: vim-rails {
autocmd FileType ruby setlocal sw=2
" }
