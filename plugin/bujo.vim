" bujo.vim - A minimalist todo list manager
" Maintainer:   Jersey Fonseca <http://www.jerseyfonseca.com/>
" Version:      0.5

" Get custom configs
let g:bujo#todo_file_path = get(g:, "bujo#todo_file_path", $HOME . "/.cache/bujo")
let g:bujo#window_width = get(g:, "bujo#window_width", 30)

" Make bujo directory if it doesn't exist"
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


" GetBujoFilePath() returns which file path we will be using. If we are in a
" git repository, we return the directory for that specific git repo.
" Otherwise, we return the general file path. 
"
" If we are passed an argument, it means that the user wants to open the
" general bujo file, so we also return the general file path in that case
function s:GetBujoFilePath(general)
  if a:general || !s:InGitRepository()
    return g:bujo#todo_file_path . "/todo.md"
  else
    let repo_name = s:GetToplevelFolder()
    let todo_path = g:bujo#todo_file_path . "/" . repo_name 
    if empty(glob(todo_path))
      call mkdir(todo_path)
    endif
    return todo_path . "/todo.md"
  endif
endfunction


" OpenTodo() opens the respective todo.md file from $HOME/.cache/bujo
" If we are in a git repository, we open the todo.md for that git repository.
" Otherwise, we open the global todo file.
"
" Paramaters : 
" 
"   mods - allows a user to use <mods> (see :h mods)
" 
"   ... - any parameter after calling :Todo will mean that the user wants
"   us to open the general file path. We check this with a:0
function s:OpenTodo(mods, ...)
  let general_bool = a:0
  let todo_path = s:GetBujoFilePath(general_bool)
  exe a:mods . " " . g:bujo#window_width "vs  " . todo_path
endfunction

if !exists(":Todo")
  command -nargs=? Todo :call s:OpenTodo(<q-mods>, <f-args>)
endif

" Update title upon file create. 
autocmd bufnewfile todo.md call append(0, "# " . split(expand('%:p:h:t'), '\v\n')[0] . " todo")  
