" deoplete-go
let g:deoplete#sources#go#use_cache = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#pointer = 1

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
nmap <Space>gt :GoTests<CR>
""nmap <Space>m :GoMetaLinter<CR>
nmap <Space>m :Neomake<CR>
""au FileType go nmap <Space>:GoMetaLinter <Plug>(gometalinter)
nmap <Space>gm :GoMetaLinter<CR>
nnoremap :gi :GoImport
nnoremap :gt :GoTests
