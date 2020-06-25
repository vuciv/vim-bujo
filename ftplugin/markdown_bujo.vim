" Edit markdown lists
" Add and remove bullets with ease
nnoremap <silent> <buffer> <Plug>BujoAddnormal i-[] 
nnoremap <silent> <buffer> <Plug>BujoChecknormal :.s/\[\]/\[x\]<Enter>
inoremap <silent> <buffer> <Plug>BujoAddinsert -[] 
inoremap <silent> <buffer> <Plug>BujoCheckinsert <esc>:.s/\[\]/\[x\]<Enter>
