" Plugins
"
" If Vundle is not installed, run this command:
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'altercation/vim-colors-solarized'
Plugin 'junegunn/vim-easy-align'
Plugin 'will133/vim-dirdiff'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'mfukar/robotframework-vim'
Plugin 'ciaranm/detectindent'
call vundle#end()
"filetype plugin indent on
set laststatus=2

set t_Co=256
let g:airline_theme='badwolf'

" Load bash aliases in shell
let $BASH_ENV = "~/.bash_aliases"

" tabs and indents
set shiftwidth=4
set tabstop=4
set smartindent
set backspace=2
set softtabstop=4

" Bash-like Tab Indent
set wildmode=longest,list,full
set wildmenu

" Color Scheme
colorscheme desert

" enable features that are probably enabled anyway
set number
set ruler
set hlsearch
syntax on

" FUCKING BELLS
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Always show tabline
set showtabline=3

" Autocomplete pairs
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
"inoremap { {<CR>}<Esc>k$a
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
"inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>
function ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
 return "\<Right>"
 else
 return a:char
 endif
endf
function CloseBracket()
 if match(getline(line('.') + 1), '\s*}') < 0
 return "\<CR>}"
 else
 return "\<Esc>j0f}a"
 endif
endf
function QuoteDelim(char)
 let line = getline('.')
 let col = col('.')
 if line[col - 2] == "\\"
 "Inserting a quoted quotation mark into the string
 return a:char
 elseif line[col - 1] == a:char
 "Escaping out of the string
 return "\<Right>"
 else
 "Starting a string
 return a:char.a:char."\<Esc>i"
 endif
endf

" Paste Mode
nnoremap <C-P> :set paste<CR>:set nonumber<CR>:GitGutterDisable<CR>
nnoremap <C-O> :set nopaste<CR>:set number<CR>:GitGutterEnable<CR>
inoremap <C-P> <Esc>:set paste<CR>:set nonumber<CR>:GitGutterDisable<CR>a
inoremap <C-O> <Esc>:set nopaste<CR>:set number<CR>:GitGutterEnable<CR>a

" Rehighlight on indent
vnoremap > ><CR>gvh
vnoremap < <<CR>gvh

" Remap increment numbers
nnoremap + <C-a>
nnoremap - <C-x>

" Escape insert mode with jj
inoremap jj <Esc>

" navigating tabs
nnoremap T :tabnew<CR>
nnoremap J :tabprevious<CR>
nnoremap K :tabnext<CR>
nnoremap <silent> H :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> L :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" Comment/uncomment select current selection
vnoremap ,c :<Backspace><Backspace><Backspace><CR>O/*<Esc>mmgv:<Backspace><Backspace><Backspace><Backspace><Backspace>'><CR>o*/<Esc>mn'mV'n
nnoremap ,c :s/^/\/\/<CR>:nohl<CR>
vnoremap ,u :<Backspace><Backspace><Backspace><CR>ddmmgv:<Backspace><Backspace><Backspace><Backspace><Backspace>'><CR>ddkmn'mV'n
nnoremap ,u :s/^\/\//<CR>:nohl<CR>

" Save
nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>a

" Easy Align
vnoremap <silent> <Enter> :EasyAlign<cr>

" Count occurences of current search
nnoremap # :%s/<c-r>///gn<ESC>

" DirDiff
let g:DirDiffExcludes = "CVS,*.class,*.exe,.*.swp,.svn,.git"
highlight DiffChange term=bold ctermbg=4 guibg=DarkMagenta

" Rainbox Parantheses
au VimEnter * RainbowParenthesesToggle

set tabpagemax=100

let g:omni_sql_no_default_maps = 1

" No newline at end of file
set noeol
