" release autogroup in MyAutoCmd
augroup MyAutoCmd
  autocmd!
augroup END

set nocompatible
set number
filetype off
filetype plugin indent off
 

" vi 互換off
set nocompatible
" コマンドモードでの補完設定
set wildmode=longest:full,list
 
" For serach
set ignorecase          " 大文字小文字を区別しない
set smartcase           " 検索文字に大文字がある場合は大文字小文字を区別
set incsearch           " インクリメンタルサーチ
set hlsearch            " 検索マッチテキストをハイライト (2013-07-03 14:30 修正）

" カーソル下の単語を * で検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR> 

" 囲み補完
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>
vnoremap " "zdi^V"<C-R>z^V"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk

" vを二回で行末まで選択
vnoremap v $h

" 行頭、行末まで移動
nnoremap  <Space>h ^
nnoremap  <Space>l $

" Add key-mappings
inoremap jj <Esc>
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>

" TABにて対応ペアにジャンプ
nnoremap <Tab> %
vnoremap <Tab> %


"最後に変更されたテキストを選択する
nnoremap gc  `[v`]
vnoremap gc ;<C-u>normal gc<Enter>
onoremap gc ;<C-u>normal gc<Enter> 

" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w>><CR>
nnoremap <S-Right> <C-w><<CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

" T + ? で各種設定をトグル
nnoremap [toggle] <Nop>
nmap T [toggle]
nnoremap <silent> [toggle]s :setl spell!<CR>:setl spell?<CR>
nnoremap <silent> [toggle]l :setl list!<CR>:setl list?<CR>
nnoremap <silent> [toggle]t :setl expandtab!<CR>:setl expandtab?<CR>
nnoremap <silent> [toggle]w :setl wrap!<CR>:setl wrap?<CR>

" w!! でスーパーユーザーとして保存（sudoが使える環境限定）
cmap w!! w !sudo tee > /dev/null %

" バックスラッシュやクエスチョンを状況に合わせ自動的にエスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

set shiftwidth=4
set tabstop=4
set expandtab
set shiftround          " '<'や'>'でインデントする際に'shiftwidth'の倍数に丸める
set infercase           " 補完時に大文字小文字を区別しない
set virtualedit=all     " カーソルを文字が存在しない部分でも動けるようにする
set hidden              " バッファを閉じる代わりに隠す（Undo履歴を残すため）
set switchbuf=useopen   " 新しく開く代わりにすでに開いてあるバッファを開く
set showmatch           " 対応する括弧などをハイライト表示する
set matchtime=3         " 対応括弧のハイライト表示を3秒にする

" SwapファイルBackupファイル無効化
set nowritebackup
set nobackup
set noswapfile

" undo file
set undodir=~/.vim/tmp
set undofile

" 対応括弧に'<'と'>'のペアを追加
set matchpairs& matchpairs+=<:>

" バックスペースでなんでも消せるようにする
set backspace=indent,eol,start

" クリップボードをデフォルトのレジスタとして指定。後にYankRingを使うので
" 'unnamedplus'が存在しているかどうかで設定を分ける必要がある
if has('unnamedplus')
    set clipboard& clipboard+=unnamedplus,unnamed
else
    set clipboard& clipboard+=unnamed
endif

" 表示関係
set number
set wrap "長いテキストの折り返し
set textwidth=0
set colorcolumn=80

" 前時代的スクリーンベルを無効化
set t_vb=
set novisualbell

" カレントディレクトリの設定
" ファイルのディレクトリを自動的にカレントディレクトリに変更
"au BufEnter * execute "":lcd "" . expand("%:p:h") "

 " 不可視文字の表示 タブ スペース 改行
set list
set listchars=tab:▸\ ,trail:~,eol:↲,extends:»,precedes:«,nbsp:%
 
" カレント行ハイライト
set cursorline
" アンダーラインをひく
autocmd VimEnter,ColorScheme * : highlight CursorLine cterm=underline ctermbg=234      
"
" Plug
call plug#begin('~/.vim/plugged')

" Plugins
Plug 'ensime/ensime-vim'
Plug 'tokozedg/vim-sman'
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'derekwyatt/vim-scala'
Plug 'plasticboy/vim-markdown'
Plug 'kannokanno/previm'
Plug 'tyru/open-browser.vim'
Plug 'yuratomo/dbg.vim'
Plug 'scrooloose/nerdtree'
"Plug "tpope/vim-fugitive"
Plug 'scrooloose/syntastic'
Plug 'tomasr/molokai'
Plug 'w0ng/vim-hybrid'
Plug 'vim-scripts/rdark'
Plug 'djjcast/mirodark'
Plug 'sjl/badwolf'
Plug 'nanotech/jellybeans.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/vimfiler'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'Simple-Javascript-Indenter'
Plug 'mattn/jscomplete-vim'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'mxw/vim-jsx'
Plug 'majutsushi/tagbar'
Plug 'kien/ctrlp.vim'
Plug 'fatih/vim-go'
Plug 'dgryski/vim-godef'
Plug 'vim-jp/vim-go-extra'
Plug 'zah/nimrod.vim'
""Plug 'miyakogi/nimrod.vim', 'improve_completion'
Plug 'Shougo/unite.vim', {
            \ 'autoload': {
            \   'commands': ['Unite', 'UniteWithBufferDir',],
            \}}
Plug 'Shougo/unite-outline', {
            \ 'autoload': {
            \   'unite_sources': ['outline'],
            \}}
Plug 'Shougo/vimproc', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    }}
Plug 'rking/ag.vim'
Plug 'ternjs/tern_for_vim', {
      \ 'build': {
      \   'others': 'npm install'
      \}}     
Plug 'davidhalter/jedi-vim', {
      \ 'autoload': {
      \   'filetypes': ['python', 'python3', 'djangohtml'],
      \ },
      \ 'build': {
      \   'mac': 'pip install jedi',
      \   'unix': 'pip install jedi',
      \ }}
call plug#end()

" Color Scheme Configure:
syntax enable
set background=dark
""let g:hyblid=256
""colorscheme hybrid
""let g:molokai=256
""colorscheme molokai
""let g:jellybeans=256
""colorscheme jellybeans
""let g:rdark=256
""colorscheme rdark
let g:badwolf=256
colorscheme badwolf
""let g:mirodark=256
""colorscheme mirodark

" Indent guids
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = ['go']
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey

"=====Unite====="
"start with insert mode
let g:unite_enable_start_insert = 1

let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

"=====syntastic=====
let g:syntastic_stl_format = '⚡ %E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w} ⚡'
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_check_on_open=0 "ファイルを開いたときはチェックしない
let g:syntastic_check_on_save=1 "保存時にはチェック
let g:syntastic_auto_loc_list=1 "エラーがあったら自動でロケーションリストopen
let g:syntastic_loc_list_height=6 "エラー表示ウィンドウの高さ
 
"=====NERDTREE=====
" keybind of NERDTree
nmap <silent> <C-q>      :NERDTreeToggle<CR>
vmap <silent> <C-q> <Esc>:NERDTreeToggle<CR>
omap <silent> <C-q>      :NERDTreeToggle<CR>
imap <silent> <C-q> <Esc>:NERDTreeToggle<CR>
cmap <silent> <C-q> <C-u>:NERDTreeToggle<CR>

let NERDTreeShowHidden=1
 
"=====neocomplete.vim=====
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#sources#buffer#disabled_pattern = ' '

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions',
    \ 'scala' : $HOME . '/.vim/dict/scala.dict',
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Enable over wride completion
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.java ='[^. \t]\.\%(\h\w*\)\?'
 

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup() 
 
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
""autocmd FileType nim setlocal omnifunc=nim#NimComplete completeopt-=preview


" Enable heavy omni completion.
""let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
""let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
""let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
""let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" =====snippets====="
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
let g:neosnippet#snippets_directory = '~/.vim/plugged/neosnippet-snippets/snippets/,~/.vim/snippets/'

" ======tern======== "
nnoremap <Space>td :TernDef<CR>
nnoremap <Space>tdp :TernDefPreview<CR>
nnoremap <Space>tr :TernRefs<CR>
nnoremap <Space>tdo :TernDoc<CR>
nnoremap <Space>tre :TernRename<CR>
nnoremap <Space>tt :TernType<CR>

let g:tern_show_signature_in_pum=1

" ======tagbar====== "
nmap <C-a> :TagbarToggle<CR>
let g:tagbar_width = 35
""autocmd FileType * nested :call tagbar#autoopen(0)
 
if !exists('g:neocomplete#omni_patterns')
    let g:neocomplete#omni_patterns = {}
endif


" Need: kannokanno/previm
nnoremap <silent> <C-]> :PrevimOpen<CR> 
" }}}         

" Nimrod
autocmd FileType nim setlocal tabstop=2 shiftwidth=2 softtabstop=2

""let g:neocomplete#force_omni_input_patterns.nim = '\h\w*\.\?'
""let g:neocomplete#omni_patterns.nim = '\h\w*\.\?'

fun! JumpToDef()
  if exists("*GotoDefinition_" . &filetype)
    call GotoDefinition_{&filetype}()
  else
    exe "norm! \<C-]>"
  endif
endf

" Jump to tag
nn <M-g> :call JumpToDef()<cr>

" Junp to last line
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END
 
"=====FileType======"
filetype plugin indent on
autocmd BufNewFile,BufRead,BufEnter *.json set filetype=json
autocmd BufNewFile,BufRead,BufEnter *.java set filetype=java
autocmd BufNewFile,BufRead,BufEnter *.js set filetype=javascript
autocmd BufNewFile,BufRead,BufEnter *.scala set filetype=scala
autocmd BufNewFile,BufRead,BufEnter *.mkd  set filetype=markdown
autocmd BufNewFile,BufRead,BufEnter *.md  set filetype=markdown
autocmd BufNewFile,BufRead,BufEnter *.py set filetype=python
autocmd BufNewFile,BufRead,BufEnter *.nim set filetype=nim
 
