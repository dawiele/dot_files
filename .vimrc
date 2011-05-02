" ~/.vimrc - (c) 1997-2007 by Robert Manea

" General settings
set nocp
set digraph ek hidden ruler sc vb wmnu
set noeb noet nosol
set bs=2 fo=cqrt ls=2 shm=at tw=72 ww=<,>,h,l
set viminfo=%,'50,\"100,:100,n~/.viminfo
syn on sync fromstart
"set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
set statusline=%<%f\ %y[%{&ff}]%m%r%w%a\ %=%l/%L,%c%V\ %P
set lcs=eol:�,tab:>-,trail:�,extends:>,precedes:<
set cmdheight=2
set showmode
set showcmd
set showmatch
set visualbell
filetype plugin indent on
set grepprg=grep\ -nH\ $*
:autocmd FileType mail :nmap <F8> :w<CR>:!aspell -e -c %<CR>:e<CR>

"Do not redraw, when running macros.. lazyredraw
set lz

"Set mapleader
let mapleader = ","
let g:mapleader = ","

set background=dark
set cursorline

"Modelines
set modeline modelines=2

" C lib function hilights (plugin)
let c_hi_identifiers = 'all'
let c_hi_libs = ['*']

"------------------------------------------------------------------------
" Autocommands

" vim -b : edit binary using xxd-format!
"
" *** USE bvi instead!
"
"augroup Binary
"  au!
"  au BufReadPre  *.bin let &bin=1
"  au BufReadPost *.bin if &bin | %!xxd
"  au BufReadPost *.bin set ft=xxd | endif
"  au BufWritePre *.bin if &bin | %!xxd -r
"  au BufWritePre *.bin endif
"  au BufWritePost *.bin if &bin | %!xxd
"  au BufWritePost *.bin set nomod | endif
"augroup END


" C and C++ prefs.
augroup C-Files
  au!
  au BufNewFile,BufRead *.c,*.C,*.cc set cindent number
  au BufNewFile *.c 0r ~/.vim/skeleton/skel.c
  "au FileType cpp,c,h set foldenable foldmethod=syntax
  au FileType cpp,c,h set comments=sl:/*,mb:**,elx:*
  au FileType cpp,c,h set foldcolumn=2
  au FileType cpp,c,h set shiftwidth=4
  "au FileType cpp,c,h syn region Block start="{" end="}" transparent fold
  " Abbreviations
  ab #d #define
  ab #i #include<
augroup END

" Turbo Assembler
" augroup Assembler
"   au BufNewFile,BufRead *.asm,*.ASM set smartindent number
"   au BufNewFile *.asm,*.ASM 0r ~/.vim/skeleton/skel.asm
"   "au Syntax asm source $VIMRUNTIME/syntax/tasm.vim
" augroup END

" Latex prefs.
augroup Tex-Files
  au!
  au BufNewFile,BufRead *.tex set tabstop=4 smartindent
  au BufNewFile *.tex 0r ~/.vim/skeleton/skel.tex
  au FileType tex ia fr \dst\frac
  au Filetype tex ia fb \fboxsep=.2in \framebox{
augroup END

" Mail and News
augroup Messages
  au!
  au BufRead mutt*[0-9],snd.*,.letter,.followup,.article,.article[0-9] set tw=72 formatoptions=2tcq comments=n:>,n::,n:#,n:% digraph
augroup END

" Perl
augroup Perl
    au!
    au BufNewFile,BufRead *.pl,*.pm set smartindent number
augroup END

" ------------------------------------------------------------------------
" Mappings

"Map space to / and c-space to ?
map <space> /
map <c-space> ?

"Switch to current dir
"map <leader>cd :cd %:p:h<cr>

map <F3> :set paste! <Bar> set paste?<CR>
imap <F3> <ESC> :set paste!<CR>i

map <F4> :set number! <Bar> set number?<CR>
imap <F4> <ESC>:set number!<CR>i

map <F7> :set list! <bar> set list?<CR>
imap <F7> <ESC>:set list!<CR>i

map <F11> :set hlsearch! <Bar> set hlsearch?<CR>

" totalcommander, file explorer
noremap <silent> <F10> :cal vimcommander<CR>

" Easy split window navigation
" use ALT+ArrowKeys to switch split windows
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
