" markdown_bujo.vim - A minimalist todo list manager
" Maintainer:   Jersey Fonseca <http://www.jerseyfonseca.com/>
" Version:      0.5

" SearchCheck() searches for whether or not BujoCheck... was called on a
" checked or unchecked task. We need to call search() twice with and without 
" the 'b' tag because search() only allows you to search forward or backwards, 
" not both ways.
"
" search() returns 0 if it the pattern was not found
function <SID>SearchCheck()
  return (search('\[\]', 'nc', line('.')) || search('\[\]', 'nbc', line('.')))
endfunction

" Edit markdown lists
" Add and remove bullets with ease
" If we are already checked then we uncheck
nnoremap <expr> <silent> <buffer> <Plug>BujoChecknormal <SID>SearchCheck() ? ':.s/\[\]/\[x\]<Enter>' : ':.s/\[x\]/\[\]<Enter>' 
nnoremap <silent> <buffer> <Plug>BujoAddnormal i-[] 
inoremap <silent> <buffer> <Plug>BujoAddinsert -[] 
inoremap <expr> <silent> <buffer> <Plug>BujoCheckinsert <SID>SearchCheck() ? '<esc>:.s/\[\]/\[x\]<Enter>' : '<esc>:.s/\[x\]/\[\]<Enter>' 
