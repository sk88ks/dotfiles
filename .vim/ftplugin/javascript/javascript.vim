setlocal omnifunc=tern#Complete completeopt-=preview

"" set syntastic jshint
let g:syntastic_javascript_checkers = ["jshint"]
"let g:syntastic_javascript_jshint_conf = "~/.jshintrc"

" shiftwidthを1にしてインデント
let g:SimpleJsIndenter_BriefMode = 1

" DOMとMozilla関連とES6のメソッドを補完
let g:jscomplete_use = ['dom', 'moz', 'es6th']

" tern_for_vim has a problem about reference 
" Should see https://github.com/ternjs/tern_for_vim/issues/88
nmap <Space>d :TernDef<CR>
nmap <Space>dv :TernDefSplit<CR>
nmap <Space>k :TernDoc<CR>
nmap <Space>t :TernType<CR>
nmap <Space>r :TernRefs<CR>
 
