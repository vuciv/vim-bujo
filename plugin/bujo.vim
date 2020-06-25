"Make bujo directory if it doesn't exist"
let g:bujo#todo_file_path = get(g:, "bujo#todo_file_path", $HOME . "/.cache/bujo")
if empty(glob(g:bujo#todo_file_path))
  call mkdir(g:bujo#todo_file_path)
endif
autocmd bufnewfile todo.md call append(0, '#Todo') 
autocmd bufnewfile todo.md call append(1, 'Date: ')
autocmd bufnewfile,bufreadpre,filewritepre todo.md exe "g/Date: */s/Date: /Date: " .strftime("%a %d %b %Y")
autocmd bufnewfile,Bufwritepre,filewritepre todo.md execute "normal Go"



" Open the bujo todo list file
function s:OpenTodo()
  "30 makes it open at width 30
  exe ":30vs" . g:bujo#todo_file_path . "/todo.md" 
endfunction

if !exists(":Todo")
  command Todo :call s:OpenTodo()
endif
