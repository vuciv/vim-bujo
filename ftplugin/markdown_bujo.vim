" Edit markdown lists
" Add and remove bullets with ease
nnoremap <buffer> <Plug>BujoAddnormal i-[] 
nnoremap <buffer> <Plug>BujoChecknormal :.s/\[\]/\[x\]<Enter>
inoremap <buffer> <Plug>BujoAddinsert -[] 
inoremap <buffer> <Plug>BujoCheckinsert <esc>:.s/\[\]/\[x\]<Enter>
