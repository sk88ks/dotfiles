setlocal omnifunc=jedi#completions completeopt-=preview

let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

python_highlight_all = 1
au FileType python let b:did_ftplugin = 1
au FileType python setlocal omnifunc=jedi#completions
let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 1

nnoremap [jedi] <Nop>
xnoremap [jedi] <Nop>
nmap <Space>j [jedi]
xmap <Space>j [jedi]

""let g:jedi#completions_command = "<C-Space>"    " 補完キーの設定この場合はCtrl+Space
let g:jedi#goto_assignments_command = "<Space>g"   " 変数の宣言場所へジャンプ（Ctrl + g)
let g:jedi#goto_definitions_command = "<Space>d"   " クラス、関数定義にジャンプ（Gtrl + d）
let g:jedi#documentation_command = "<Space>k"      " Pydocを表示（Ctrl + k）
let g:jedi#rename_command = "[jedi]r"
let g:jedi#usages_command = "[jedi]n"
let g:jedi#popup_select_first = 0
let g:jedi#popup_on_dot = 0
 

