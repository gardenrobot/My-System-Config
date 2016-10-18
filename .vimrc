" Plugins
"
" If vim-plug is not installed, run these commands:
" mkdir -p ~/.vim/autoload
" curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
call plug#begin('~/.vim/plugged')
Plug 'bronson/vim-trailing-whitespace'
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/vim-easy-align'
Plug 'will133/vim-dirdiff'
Plug 'kien/rainbow_parentheses.vim'
"Plug 'vim-scripts/phpfolding.vim'
call plug#end()

" Load bash aliases in shell
let $BASH_ENV = "~/.bash_aliases"

" tabs and indents
set shiftwidth=4
set tabstop=4
set smartindent
set backspace=2
" use space characters
set expandtab

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
nnoremap <C-P> :set paste<CR>:set nonumber<CR>
nnoremap <C-O> :set nopaste<CR>:set number<CR>
inoremap <C-P> <Esc>:set paste<CR>:set nonumber<CR>a
inoremap <C-O> <Esc>:set nopaste<CR>:set number<CR>a

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
nnoremap <silent> L :execute 'silent! tabmove ' . (tabpagenr())<CR>

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
let g:DirDiffExcludes = "CVS,*.class,*.exe,.*.swp,.svn"
highlight DiffChange term=bold ctermbg=4 guibg=DarkMagenta

" Rainbox Parantheses
au VimEnter * RainbowParenthesesToggle
