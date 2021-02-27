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
ge	    移动到前一个单词的结尾
gE	    移动到前一个词组的结尾
```

词组和单词到底有什么相同和不同呢？单词和词组都按照非空字符被分割，一个单词指的是一个只包含`a-zA-Z0-9`字符串，一个词组指的是一个包含除了空字符(包括空格，tab，EOL)以外的字符的字符串。



行内导航

```
0		跳到本行第一个字符
^		跳到本行第一个非空字符
g_      跳到本行最后一个非空字符
$		跳到本行最后一个字符
```

```
f   在同一行向后搜索第一个匹配
F   在同一行向前搜索第一个匹配
t   在同一行向后搜索第一个匹配，并停在匹配前
T   在同一行向前搜索第一个匹配，并停在匹配前
;   在同一行重复最近一次搜索
,   在同一行向相反方向重复最近一次搜索
```



匹配导航

如果你在它们中的某一对括号中，你可以通过`%`跳到其中一个括号或另一个上(如果存在)。



行号导航

```
gg      跳转到第一行
G       跳转到最后一行
nG      跳转到第n行
n%      跳到文件的n%
CRTL-g  查看文件总行数
```



窗格导航

```
H   跳转到屏幕的顶部
M   跳转到屏幕的中间
L   跳转到屏幕的底部
nH  跳转到距离顶部n行的位置
nL  跳转到距离底部n行的位置
```



滚动

页面滚动

滚动一整页(`CTRL-f`/`CTRL-b`)，滚动半页(`CTRL-d`/`CTRL-u`)，滚动一行`CTRL-e`/`CTRL-y`)。

```
Ctrl-e    向下滚动一行
Ctrl-d    向下滚动半屏
Ctrl-f    向下滚动一屏
Ctrl-y    向上滚动一行
Ctrl-u    向上滚动半屏
Ctrl-b    向上滚动一屏
```

基于当前行滚动

```
zt    将当前行置于屏幕顶部附近
zz    将当前行置于屏幕中央
zb    将当前行置于屏幕底部
```



搜索导航

```
/   向后搜索一个匹配
?   向前搜素一个匹配
n   重复上一次搜索(和上一次方向相同)
N   重复上一次搜索(和上一次方向相反)
```

你可以通过`*`快速的向下搜索光标下的文本，通过`#`快速向前搜索光标下的文本。 如果你的光标位于一个字符串"one"上，按下`*`相当于`/\<one\>`。 `/\<one\>`中的`\<`和`\>`表示整词匹配，使得一个更长的包含"one"的单词不会被匹配上，也就是说它会匹配"one"，但不会匹配"onetwo"。 如果你的光标在"one"上并且你想向后搜索完全或部分匹配的单词，例如"one"和"onetwo"，你可以用`g*`替代`*`。

```
*   向后查找光标所在的完整单词
#   向前查找光标所在的完整单词
g*  向后搜索光标所在的单词
g#  向前搜索光标所在的单词
```



位置标记

`a-z`的标签和`A-Z`的标签存在一个区别，小写字母是局部标签，大写字母是全局标签(也称文件标记)。

我们首先说说局部标记。 每个buffer可以有自己的一套局部标记，如果打开了两个文件，我可以在第一个文件中设置标记"a"(`ma`)，然后在另一个文件中设置另一个标记"a"(`ma`)。

不像你可以在每个buffer中设置一套局部标签，你只能设置一套全局标签。 如果你在`myFile.txt`中设置了标签`mA`，下一次你在另一个文件中设置`mA`时，A标签的位置会被覆盖。 全局标签有一个好处就是，即使你在不同的项目红，你也可以跳转到任何一个全局标签上，全局标签可以帮助你在文件间切换。



