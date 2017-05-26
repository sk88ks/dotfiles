setlocal omnifunc=go#complete#Complete completeopt-=preview

let g:neocomplete#omni_patterns.go ='[^. \t]\.\%(\h\w*\)\?'
 
"vim-go"
let g:go_play_open_browser = 0
let g:go_fmt_fail_silently = 1
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_disable_autoinstall = 1
let g:go_snippet__engine = "neosnippet"
let g:go_metalinter_enabled = ['goimports', 'misspell', 'unused']

nmap <Space>i <Plug>(go-info)
nmap <Space>k <Plug>(go-doc)
nmap <Space>kv <Plug>(go-doc-vertical)
nmap <Space>b <Plug>(go-build)
nmap <Space>t <Plug>(go-test)
nmap <Space>d <Plug>(go-def)
nmap <Space>ds <Plug>(go-def-split)
nmap <Space>dv <Plug>(go-def-vertical)
nmap <Space>dt <Plug>(go-def-tab)
""nmap <Space>l :GoLint<CR>
nmap <Space>v :GoVet<CR>
nmap <Space>e <Plug>(go-rename)
nmap <Space>m :GoMetaLinter<CR>
""au FileType go nmap <Space>:GoMetaLinter <Plug>(gometalinter)
nnoremap :gm :GoMetaLinter
nnoremap :gi :GoImport
 
" golintの実行パスを追加
execute "set rtp+=".globpath($GOPATH, "src/github.com/golang/lint/misc/vim")
" syntastic設定
""let g:syntastic_go_checkers = ['go', 'golint', 'govet', 'gocyclo']
""let g:syntastic_go_checkers = ['gometalinter']
 
