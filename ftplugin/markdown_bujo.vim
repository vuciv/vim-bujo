" Edit markdown lists
" Add and remove bullets with ease
nnoremap <buffer> <C-Enter> i-[] 
nnoremap <buffer> <C-BS> :.s/\[\]/\[x\]<Enter>
inoremap <buffer> <C-Enter> -[] 
inoremap <buffer> <C-BS> <esc>:.s/\[\]/\[x\]<Enter>
