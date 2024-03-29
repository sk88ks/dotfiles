" Set homes
let g:cache_home = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let g:config_home = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME

let g:python_host_prog = $HOME . '/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = $HOME . '/.pyenv/versions/neovim3/bin/python'

let mapleader = "\<Space>"

" Completion for command mode
set wildmode=longest:full,list

" For serach
set ignorecase          " Not destinguish between cases
set smartcase           " Destinguish between cases in search string
set incsearch           " Incremental search
set hlsearch            " Highlight search match

" Completion for brackets
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<LEFT>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap [ []<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>
vnoremap " "zdi^V"<C-R>z^V"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

" Center searched word
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

nnoremap j gj
nnoremap k gk

"  Select the end of line
vnoremap v $h

" Jump to the haead and end of line
nnoremap  <Leader>h ^
nnoremap  <Leader>l $

command -nargs=1 MyLineSearch let @m=<q-args> | call search('^\s*'. @m)
command -nargs=1 MyLineBackSearch let @m=<q-args> | call search('^\s*'. @m, 'b')
nnoremap <Space>f :MyLineSearch<Space>
nnoremap <Space>F :MyLineBackSearch<Space>
command MyLineSameSearch call search('^\s*'. @m)
command MyLineBackSameSearch call search('^\s*'. @m, 'b')
nnoremap <Space>; :MyLineSameSearch<CR>
nnoremap <Space>, :MyLineBackSameSearch<CR>

" Add key-mappings
inoremap <silent>jj <Esc>
vnoremap <silent><C-j> <Esc>
"inoremap <silent><C-[> <Esc>
"vnoremap <silent><C-[> <Esc>

" Tab jump
nnoremap <Tab> %
vnoremap <Tab> %


" Select the last word
nnoremap gc  `[v`]
vnoremap gc ;<C-u>normal gc<Enter>
onoremap gc ;<C-u>normal gc<Enter>

" Move windows
""nnoremap <C-h> <C-w>h
""nnoremap <C-j> <C-w>j
""nnoremap <C-k> <C-w>k
""nnoremap <C-l> <C-w>l

" As super user
cmap w!! w !sudo tee > /dev/null %

" Escape ? and /
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

" window
""set termguicolors
""set pumblend=20
""hi Pmenu guifg=#2e3440 guibg=#a3be8c

set shiftwidth=4
set tabstop=4
set expandtab
set shiftround          " Set multiple for shiftwidth
set infercase           " Not distinguish between cases in completion
set virtualedit=all
set hidden              " Hide buffer
set switchbuf=useopen   " Reuse buffer
set showmatch           " Highlight brackets
set matchtime=3         " Highlight for 3 seconds
set visualbell          " no beep
set smarttab            " smart tags
set smartindent         " Smart indent
set noeol

" Ignore swap and backup file
set nowritebackup
set nobackup
set noswapfile

" undo file
set undodir=~/.vim/tmp
set undofile

set matchpairs& matchpairs+=<:>

set backspace=indent,eol,start

" Use clip board
if has('unnamedplus')
    set clipboard& clipboard+=unnamedplus,unnamed
else
    set clipboard& clipboard+=unnamed
endif

" Auto read
""autocmd BufWritePost * sleep 1
autocmd BufWritePost * checktime
set autoread

" For expressions
set ttimeout
set ttimeoutlen=50
""set number
set relativenumber
set wrap
set textwidth=0
set colorcolumn=80
set t_vb=
set novisualbell
set list
set listchars=tab:▸\ ,trail:~,eol:↲,extends:»,precedes:«,nbsp:%
set cursorline
au  VimEnter,ColorScheme * : highlight CursorLine cterm=underline ctermbg=234

" open terminal
nnoremap <silent> <Leader>tt :<C-u>terminal<CR>
nnoremap <silent> <Leader>ts :<C-u>execute 'split \| terminal'<CR>
nnoremap <silent> <Leader>tv :<C-u>execute 'vsplit \| terminal'<CR>
tnoremap <silent> <Leader>ts <C-\><C-n>:execute 'split \| terminal'<CR>
tnoremap <silent> <Leader>tv <C-\><C-n>:execute 'vsplit \| terminal'<CR>

" to normal mode
tnoremap <silent> <C-[> <C-\><C-n>

" close terminal
tnoremap <silent> <C-q> <C-\><C-n>:q<CR>

" Junp to last line
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

" For dein
let s:dein_cache_dir = g:cache_home . '/dein'

" Reset augroup
""augroup MyAutoCmd
""    autocmd!
""augroup END

if &runtimepath !~# '/dein.vim'
    let s:dein_repo_dir = s:dein_cache_dir . '/repos/github.com/Shougo/dein.vim'

    " Auto Download
    if !isdirectory(s:dein_repo_dir)
        call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
    endif

    execute 'set runtimepath^=' . s:dein_repo_dir
endif

" dein.vim settings
let g:dein#install_max_processes = 16
let g:dein#install_progress_type = 'title'
let g:dein#install_message_type = 'none'
let g:dein#enable_notification = 1

if dein#load_state(s:dein_cache_dir)
    call dein#begin(s:dein_cache_dir)

    let s:toml_dir = g:config_home . '/nvim/dein'

    call dein#load_toml(s:toml_dir . '/plugins.toml', {'lazy': 0})
    call dein#load_toml(s:toml_dir . '/lazy.toml', {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
    call dein#install()
endif

" Color schema
filetype plugin indent on
let g:badwolf=256
"colorscheme badwolf
"colorscheme gruvbox
"colorscheme dogrun
"colorscheme onedark
colorscheme challenger_deep
syntax on

highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight SpecialKey ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE

"Util keybinds
imap <silent> <C-D>d <C-R>=strftime("%Y-%m-%d")<CR>
imap <silent> <C-D>t <C-R>=strftime("%H:%M:%S")<CR>

" tags
""nnoremap <Space>dv :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
""nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>

" Ctrlp
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" Remove unnecessary spaces
autocmd BufWritePre * call s:remove_unnecessary_space()
function! s:remove_unnecessary_space()
    " delete last spaces
    %s/\s\+$//ge

    " delete last blank lines
    while getline('$') == ""
            $delete _
    endwhile
endfunction
