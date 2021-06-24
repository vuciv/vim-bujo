# vim-bujo

This plugin allows people to easily access and manage todo lists for their projects from vim.

You can easily access and manage Todo lists of specific projects or a general Todo list.

## Installation

If you use a plugin manager, such as [vim-plug], follow its instructions on how to install plugins from github.

To install the stable version of the plugin, if using [vim-plug], put this in your `vimrc`/`init.vim`:

```
Plug 'vuciv/vim-bujo'
```



## Use / Mappings

* Open Todo of current git repo:
  ```
  :Todo // from git repo
  ```
* Open general Todo:
  ```
  :Todo g
  ```
  
* Using mods:
  ```
  :botright Todo
  :botright Todo g
  ```
__You can see more mod commands at [:h mods]__

* Insert a new task:
  ```
  nmap <C-S> <Plug>BujoAddnormal
  imap <C-S> <Plug>BujoAddinsert
  ```
* Check off a task:
  ```
  nmap <C-Q> <Plug>BujoChecknormal
  imap <C-Q> <Plug>BujoCheckinsert
  ```
  
* Change cache directory:
  ```
  let g:bujo#todo_file_path = $HOME . "/.cache/bujo"
  ```

* Change todo window width:
  ```
  let g:bujo#window_width = 40
  ```
  * Press ```Ctrl-W n <``` replace _n_ with the number of steps you want to move to the left
  * Press ```Ctrl-W n >``` replace _n_ with the number of steps you want to move to the right


## Screenshots

This gif shows how the Todo list opens up in vim.

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

I plan to add diary capabilities, and all the fun little 
quotes and activities that make actual bullet journaling fun!

If you would like to work on this project with me, please
reach out to me on [twitter]


[twitter]: https://twitter.com/FonsecaJersey
[vim-plug]: https://github.com/junegunn/vim-plug
[:h mods]: https://vimhelp.org/map.txt.html#%3Cmods%3E

## License

Copyright (c) Jersey Fonseca.  Distributed under the same terms as Vim itself.
See `:help license`.
