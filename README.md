# vim-bujo

This plugin allows people to easily access and manage a minimalist todo list from vim.


## Installation

If you use a plugin manager, such as [vim-plug], follow its instructions on how to install plugins from github.

To install the stable version of the plugin, if using [vim-plug], put this in your `vimrc`/`init.vim`:

```
Plug 'jfonseca8/vim-bujo'
```



## Use / Mappings

* Run:
  ```
  :Todo
  ```
* Insert a new task:
  ```
  nmap <C-Enter> <Plug>bujo#AddTodoNormal
  imap <C-Enter> <Plug>bujo#AddTodoInsert
  ```
* Check off a task:
  ```
  nmap <C-BS> <Plug>bujo#CheckTodoNormal
  imap <C-BS> <Plug>bujo#CheckTodoInsert
  ```
* Change cache directory:
  ```
  let g:bujo#todo_file_path = $HOME . "/.cache/bujo"
  ```



## Screenshots

This gif shows how the TODO list opens up in vim.

![Gif of Bujo use](https://raw.githubusercontent.com/jfonseca8/vim-bujo/master/screenshots/bujo.gif)

We can also see that the task list is very easy to manage.

The ascii art is inserted manually, but you can do that yourself with the file 'templates/md.skeleton'


## Notes

Feedback and bug reports are welcomed and encouraged.
If you want new features, please do let me know. I
would be honored at the opportunity to make a tool
better for the community.

I built this because I wanted the ease of vim bindings
with the benefits of keeping a todo list on hand. It is
very simple and minimialist. 

I plan to add diary capabilities, calendar views, history,
and all the fun little quotes and activities that make actual
bullet journaling fun!

If you would like to work on this project with me, please
reach out to me on [twitter]


[twitter]: https://twitter.com/FonsecaJersey
[vim-plug]: https://github.com/junegunn/vim-plug
