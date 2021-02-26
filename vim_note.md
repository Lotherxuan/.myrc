##### vim备忘录

TODO:

阅读第三章 使用插件在vim中进行搜索的部分

Ctrl + z 或者:stop 挂起当前的vim进程



在终端中用fg将挂起的vim进程调度到前台



:buffer 或者:ls 或者:files查看打开的缓冲区



操作buffer

- `:bnext` to go to the next buffer (`:bprevious` to go to the previous buffer).
- `:buffer` + filename. Vim can autocomplete filename with `<Tab>`.
- `:buffer` + `n`, where `n` is the buffer number. For example, typing `:buffer 2` will take you to buffer #2.
- Jump to the older position in jump list with `Ctrl-O` and to the newer position with `Ctrl-I`. These are not buffer specific methods, but they can be used to jump between different buffers. I will talk more about jumps in Chapter 5.
- Go to the previously edited buffer with `Ctrl-^`.



在打开的windows中移动：

```
Ctrl-W H    Moves the cursor to the left window
Ctrl-W J    Moves the cursor to the window below
Ctrl-W K    Moves the cursor to the window upper
Ctrl-W L    Moves the cursor to the right window
```



指定当前窗口显示某个缓冲区内容

```
:buffer file2.js
```



操作窗口(window)

```
Ctrl-W V    Opens a new vertical split
Ctrl-W S    Opens a new horizontal split
Ctrl-W C    Closes a window
Ctrl-W O    Makes the current window the only one on screen and closes other windows
```



```
:vsplit filename    Split window vertically
:split filename     Split window horizontally
:new filename       Create new window
```



操作标签页(tab)

```
:tabnew file.txt    Open file.txt in a new tab
:tabclose           Close the current tab
:tabnext            Go to next tab
:tabprevious        Go to previous tab
:tablast            Go to last tab
:tabfirst           Go to first tab

You can also run gt to go to next tab page (you can go to previous tab with gT). You can pass count as argument to gt, where count is tab number. To go to the third tab, do 3gt.
```

To start Vim with multiple tabs, you can do this from the terminal:

```
vim -p file1.js file2.js file3.js
```



3D视角移动

z轴上移动(即同一window的不同buffer间移动)

Moving between buffers is like traveling across the Z axis in a Cartesian coordinate. Imagine your buffer files lining up across the Z axis. You can traverse the Z axis one buffer at a time with `:bnext` and `:bprevious`. You can jump to any coordinate in Z axis with `:buffer filename/buffernumber`.



在vim中打开文件

To open a file in Vim, you can use `:edit`.

```
:edit file.txt
```

文件名接受通配符，不是作为参数展开，而是按\<Tab\>键展开文件名，可以再按\<Tab\>键进行选择



vim原生file explorer netrw操作

```
%    Create a new file
d    Create a new directory
R    Rename a file or directory
D    Delete a file or directory
```

在终端打开目录

```
vim .
vim src/client/
vim app/controllers/
```

在vim内部打开目录

```
:edit .
:edit src/client/
:edit app/controllers/
```



vim语法规则

There is only one grammar rule in Vim language:

```
verb + noun
```



单词导航

```
w		移动到下一个单词的开头
W		移动到下一个词组的开头
e		移动到下一个单词的结尾
E		移动到下一个词组的结尾
b		移动到前一个单词的开头
B		移动到前一个词组的开头
ge	移动到前一个单词的结尾
gE	移动到前一个词组的结尾
```