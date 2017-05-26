""setlocal omnifunc=scala#complete#Complete completeopt-=preview

""let g:neocomplete#force_omni_input_patterns.scala ='[^. \t]\.\%(\h\w*\)\?'
""let g:neocomplete#omni_patterns.scala ='[^. \t]\.\%(\h\w*\)\?'
let ensime_server_v2 = 1
let g:neocomplete#force_omni_input_patterns.scala = '\k\.\k*'
let g:neocomplete#omni_patterns.scala = '\k\.\k*'

" ensime
nnoremap <Space>t :EnType<CR>
nnoremap <Space>d :EnDeclaration<CR>
nnoremap <Space>dv :EnDeclarationSplit v<CR>
nnoremap <Space>k :EnDocBrowse<CR>
nnoremap <Space>ec :EnClasspath<CR>
au BufWritePost *.scala :EnTypeCheck
