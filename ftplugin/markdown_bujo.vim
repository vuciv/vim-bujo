" Edit markdown lists
" Add and remove bullets with ease
nnoremap <buffer> <Plug>bujo#AddTodoNormal i-[] 
nnoremap <Plug>bujo#CheckTodoNormal :.s/\[\]/\[x\]<Enter>
inoremap <buffer> <Plug>bujo#AddTodoInsert -[] 
inoremap <buffer> <Plug>bujo#CheckTodoInsert <esc>:.s/\[\]/\[x\]<Enter>
