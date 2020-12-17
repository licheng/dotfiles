" vim: set foldmarker={,} foldlevel=0 foldmethod=marker:

" Basic Settings {
set nocompatible
set encoding=utf-8
if has('win32')
    set termencoding=cp936
endif
let $LANG = 'en'
"set term=xterm
set t_Co=256
set wildmode=longest,list,full
set wildmenu
" }

" Vundle Settings {
" To Install Vundle:
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" vim +PluginInstall +qall
filetype off
set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/vimfiles/
call vundle#rc()
Plugin 'gmarik/vundle'
" Custom Plugins {
Plugin 'Smart-Home-Key'
Plugin 'SingleCompile'
Plugin 'bufexplorer.zip'
Plugin 'a.vim'
Plugin 'estin/htmljinja'
Plugin 'w0rp/ale'
Plugin 'jdevera/vim-protobuf-syntax.git'
Plugin 'dyng/ctrlsf.vim'
Plugin 'ledger/vim-ledger'
Plugin 'flazz/vim-colorschemes'
Plugin 'majutsushi/tagbar'
Plugin 'SirVer/ultisnips'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
"Plugin 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
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
if !has("win32")
    set shellslash
endif
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
if has("gui_running")
    if has('mac')
        set guioptions=egrL guifont=Monaco:h14 lines=40 columns=80 nowrap
    elseif has('unix')
        set guioptions=egrL guifont=Inconsolata\ 13 lines=40 columns=80 nowrap
    elseif has('win32')
        set guioptions=egrL guifont=Consolas:h11 lines=40 columns=80 nowrap
    endif
else
    set wrap
endif
set statusline=\ %t\ %r%m\ %#CursorLine#%=%#CursorIM#\ %{&ff.'\ '.&fenc.'\ '.&ft}\ %#Cursor#\ %l:%c\ %p%%\ 
set laststatus=2
" }

" Edit related {
set backspace=indent,eol,start
set whichwrap=b,s,<,>,[,]
set selectmode=
set selection=exclusive
set keymodel=startsel,stopsel
let g:python_recommended_style=0
map <C-c> "+y<CR>
map! <C-v> <C-r>+
if has('python')
    map <C-k> :pyf /usr/local/share/clang/clang-format.py<cr>
    imap <C-k> <c-o>:pyf /usr/local/share/clang/clang-format.py<cr>
elseif has('python3')
    map <C-k> :py3f /usr/local/share/clang/clang-format.py<cr>
    imap <C-k> <c-o>:py3f /usr/local/share/clang/clang-format.py<cr>
endif

map <A-1> 1gt
map <A-2> 2gt
map <A-3> 3gt
map <A-4> 4gt
map <A-5> 5gt
imap <A-1> <C-O>1gt
imap <A-2> <C-O>2gt
imap <A-3> <C-O>3gt
imap <A-4> <C-O>4gt
imap <A-5> <C-O>5gt
" }

" Syntax related {
syntax on
let g:load_doxygen_syntax=1
set tabstop=4 shiftwidth=4
set colorcolumn=80
set synmaxcol=200
set smarttab
set expandtab
set cindent cinoptions=:0g0t0(2susj1N-s
set autoindent
set linebreak ambiwidth=double
set formatoptions+=mB
autocmd FileType python setlocal sw=4 ts=4 noexpandtab
" }

" SVN related {
if has("win32")
    map <silent> \tl :silent !start TortoiseProc.exe /command:log /path:% /notempfile /closeonend<CR>
    map <silent> \tb :silent :exe "!start TortoiseProc.exe /command:blame /path:" . shellescape(expand("%")) . " /line:" . line(".") . " /notempfile /closeonend"<CR>
endif
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

" Plugin: vim-ledger {
let g:ledger_bin = 'hledger'
" }

" Plugin: ctrlsf.vim {
let g:ctrlsf_default_root = 'project'
let g:ctrlsf_context = '-C 5'
let g:ctrlsf_extra_root_markers = ['.project']
let g:ctrlsf_extra_backend_args = {
    \ 'rg': '--no-require-git -tc -t cpp -t cmake -t cs -t java -t objc -t objcpp -t py -t sh '
    \ }
let g:ctrlsf_auto_close = {
    \ "normal" : 0,
    \ "compact": 0
    \}
nmap \ss <Plug>CtrlSFPrompt
nmap \sw <Plug>CtrlSFCwordPath
nmap \sc :CtrlSFToggle<CR>
" }

" Plugin: tagbar {
if has('win32')
    let g:tagbar_ctags_bin = 'C:\cygwin64\bin\ctags.exe'
endif
nmap <F3> :TagbarToggle<CR>
" }
"
" Plugin: ale {
let g:ale_linters = {'python': ['flake8']}
let g:ale_python_flake8_executable = 'python'
let g:ale_python_flake8_options = '-m flake8 --ignore=E115,E12,E20,E22,E23,E24,E25,E26,E30,E101,E117,E402,E501,E502,E711,E722,W191,W291,W293,W391,W601 --builtins=_tr'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
" }

" Plugin: fzf {
let g:fzf_layout = { 'down': '~60%' }

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

function! FindProjectRoot()
    let l:spath = expand('%:p')
    let l:markers = ['.project', '.git', '.hg', '.svn', '.bzr', 'tags']
    while 1
        let l:ppath = fnamemodify(spath, ':h')
        if l:ppath == l:spath
            break
        endif
        for l:marker in l:markers
            if !empty(globpath(l:ppath, l:marker))
                return l:ppath
            endif
        endfor
        let l:spath = l:ppath
    endwhile

    return expand('%:p:h')
endfunction

command! -bang ProjectFiles call fzf#vim#files(FindProjectRoot(), <bang>0)
map <C-P>   :ProjectFiles<CR>

command! -bar -bang -nargs=? -complete=buffer FZFBuffers  call fzf#vim#buffers(<q-args>, { "placeholder": "{1}", "options": ["-d", "\t"] }, <bang>0)
map <F2>    :FZFBuffers<CR>
" }
