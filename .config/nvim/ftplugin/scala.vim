" ensime vim
let ensime_server_v2 = 1
nnoremap <Space>t :EnType<CR>
nnoremap <Space>d :EnDeclaration<CR>
nnoremap <Space>dv :EnDeclarationSplit v<CR>
nnoremap <Space>k :EnDocBrowse<CR>
nnoremap <Space>ec :EnClasspath<CR>
"au BufWritePost *.scala :EnTypeCheck         
