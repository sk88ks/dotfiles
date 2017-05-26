" node.vim
autocmd User Node
  \ if &filetype == "javascript" |
  \   nmap <buffer> gf <Plug>NodeVSplitGotoFile |
  \ endif        

""setlocal omnifunc=tern#Complete completeopt-=preview

" shiftwidth is 1
let g:SimpleJsIndenter_BriefMode = 1

" tern_for_vim has a problem about reference 
" Should see https://github.com/ternjs/tern_for_vim/issues/88
nmap <Space>d :TernDef<CR>
nmap <Space>dv :TernDefSplit<CR>
""nmap <Space>dv gf<CR>
nmap <Space>k :TernDoc<CR>
nmap <Space>t :TernType<CR>
nmap <Space>r :TernRefs<CR>
 
