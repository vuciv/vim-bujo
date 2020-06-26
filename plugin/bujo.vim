" bujo.vim - A minimalist todo list manager
" Maintainer:   Jersey Fonseca <http://www.jerseyfonseca.com/>
" Version:      0.5

"Make bujo directory if it doesn't exist"
let g:bujo#todo_file_path = get(g:, "bujo#todo_file_path", $HOME . "/.cache/bujo")
if empty(glob(g:bujo#todo_file_path))
  call mkdir(g:bujo#todo_file_path)
endif

" InGitRepository() tells us if the directory we are currently working in
" is a git repository. It makes use of the 'git rev-parse --is-inside-work-tree'
" command. This command outputs true to the shell if so, and a STDERR message 
" otherwise.
"
" We will use this function to know whether we should open a specific
" project's todo list, or a global todo list.
function s:InGitRepository()
  :silent let bool = system("git rev-parse --is-inside-work-tree")

  " The git function will return true with some leading characters
  " if we are in a repository. So, we split off those characters
  " and just check the first word.
  if split(bool, '\v\n')[0] == 'true'
    return 1
  endif
endfunction


" GetToplevelFolder() gives us a clean name of the git repository that we are
" currently working in
function s:GetToplevelFolder()
  let absolute_path = system("git rev-parse --show-toplevel")
  let repo_name = split(absolute_path, "/")
  let repo_name_clean = split(repo_name[-1], '\v\n')[0]
  return repo_name_clean
endfunction

" OpenTodo() opens the respective todo.md file from $HOME/.cache/bujo
" If we are in a git repository, we open the todo.md for that git repository.
" Otherwise, we open the global todo file.
function s:OpenTodo(...)
  " If an argument was passed in, we open the general file
  " a:0 will be false if no argument was passed in (a:0 == 0) 
  if a:0 || !s:InGitRepository()
    exe ":30vs" . g:bujo#todo_file_path . "/todo.md" 
  else 
    let repo_name_clean = s:GetToplevelFolder()
    let todo_path = g:bujo#todo_file_path . "/" . repo_name_clean 
    if empty(glob(todo_path))
      call mkdir(todo_path)
    endif
    exe ":30vs" . todo_path . "/todo.md"
  endif
endfunction

if !exists(":Todo")
  command -nargs=? Todo :call s:OpenTodo(<f-args>)
endif

autocmd bufnewfile todo.md call append(0, '#' . split(expand('%:p:h:t'), '\v\n')[0] . " todo")  
autocmd bufnewfile todo.md call append(1, 'Date: ')
autocmd bufnewfile,bufread,filewritepre todo.md exe "g/Date: */s/Date: *.*/Date: " .strftime("%a %d %b %Y")
autocmd bufnewfile,Bufwritepre,filewritepre todo.md execute "normal Go"
