" Plugin manager. If Vundle is not installed, run this command:
" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
set nocompatible

call plug#begin()
Plug 'bronson/vim-trailing-whitespace'
Plug 'junegunn/vim-easy-align'
Plug 'will133/vim-dirdiff'
Plug 'kien/rainbow_parentheses.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
"Plug 'ciaranm/detectindent'
Plug 'georgewitteman/vim-fish'
"Plug 'neoclide/coc.nvim', { 'branch': 'release', 'do': 'npm ci' }
Plug 'luizribeiro/vim-cooklang', { 'for': 'cook' }
Plug 'https://github.com/adelarsq/vim-matchit'
Plug 'tpope/vim-surround'
call plug#end()

" Run bash aliases from inside vim. Run this command to get this to work.
" echo -e "shopt -s expand_aliases\nsource ~/.bash_aliases" > ~/.vimrc_bash
let $BASH_ENV = "~/.vimrc_bash"

" Color Scheme
colorscheme desert

" Enable syntax highlighting
syntax on

" Enable Rainbox Parantheses
au VimEnter * RainbowParenthesesToggle

" In visual mode, press enter to EasyAlign the selection
vnoremap <silent> <Enter> :EasyAlign<cr>

" Bash-like Tab Indent
set wildmode=longest,list,full
set wildmenu

" Enable filetype detection
filetype on

" Enable line numbers on left
set number

" Always show tabline
set showtabline=3

" Enable status line on bottom
set laststatus=2

" Keep 4 lines above/below cursor
set scrolloff=4

" Enable colors on airline
set t_Co=256

" Highlight search matches
set hlsearch

" DirDiff
let g:DirDiffExcludes = ".*.swp,.git"

" Increase max number of tabs
set tabpagemax=200

" Press # to count occurences of current search
nnoremap # :%s/<c-r>///gn<ESC>

" Press Ctrl-s in normal mode to save
nnoremap <c-s> :wa<CR>

" Ctrl-l redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" bindings for navigating tabs
nnoremap T :tabnew<CR>
nnoremap J :tabprevious<CR>
nnoremap K :tabnext<CR>
nnoremap <silent> H :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> L :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" Ctrl-p enters paste mode. Ctrl-o exits it.
nnoremap <C-P> :set paste<CR>:set nonumber<CR>:GitGutterDisable<CR>
nnoremap <C-O> :set nopaste<CR>:set number<CR>:GitGutterEnable<CR>
inoremap <C-P> <Esc>:set paste<CR>:set nonumber<CR>:GitGutterDisable<CR>a
inoremap <C-O> <Esc>:set nopaste<CR>:set number<CR>:GitGutterEnable<CR>a

" In visual mode, keep selection selected after indenting/unindenting.
vnoremap > ><CR>gvh
vnoremap < <<CR>gvh

" + increments a number. - decrements it.
nnoremap + <C-a>
nnoremap - <C-x>

" In insert mode, press jj to exit
:imap jj <Esc>

" TODO when searching and press :, create a s/// with the current selection as the thing to replace. Put the cursor place to type the replacement.

" TODO keybindings to comment/uncomment. Filetype specific.

" TODO autocomplete pairs ()[] on certain files

" TODO when typing on the bottom, ctrl-arrowkey moves to next word

" In visual mode, * will put the current selection in a search
" TODO make it so the search does not advance to the next match
":let @/='foobar'
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

function! s:get_visual_selection()
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - 2]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction

" Display tabs as 4 spaces.
set tabstop=4
set softtabstop=4

" Make tab characters visible
set list
set listchars=tab:▸\ 

" Shifting one indent will shift by 4 spaces.
set shiftwidth=4

" Pressing tab key creates 4 spaces.
set expandtab

" Pressing backspace deletes 4 spaces.
set backspace=2

" Indent when pressing enter. Pretty dumb.
set cindent

" Stop vim from yeeting the current line's indentation when pressing certain characters.
set cinkeys-=0#
set cinkeys-=:
set indentkeys-=0#
set cinoptions+=(s,m1

" Use 2-spaces for yaml and cfg
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType yaml setlocal expandtab
autocmd FileType cfg  setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType cfg  setlocal expandtab
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType ruby setlocal expandtab
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html setlocal expandtab

" Continue comment headers (//, #) on new line
set formatoptions+=ro

" Wrap rust's triple slash documentation comments
set comments^=:///
set comments^=://!

"inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

"let g:coc_node_path = '/home/sambot/.nvm/versions/node/v16.18.1/bin/node'
