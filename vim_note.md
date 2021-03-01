### vim备忘录

TODO:

阅读第三章 使用插件在vim中进行搜索的部分

搜索部分 跟正则表达式有没有什么区别？



Ctrl + z 或者:stop 挂起当前的vim进程



在终端中用fg将挂起的vim进程调度到前台



:buffer 或者:ls 或者:files查看打开的缓冲区



#### 操作buffer

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



#### 操作窗口(window)

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



#### 操作标签页(tab)

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



#### 3D视角移动

z轴上移动(即同一window的不同buffer间移动)

Moving between buffers is like traveling across the Z axis in a Cartesian coordinate. Imagine your buffer files lining up across the Z axis. You can traverse the Z axis one buffer at a time with `:bnext` and `:bprevious`. You can jump to any coordinate in Z axis with `:buffer filename/buffernumber`.



#### 在vim中打开文件

To open a file in Vim, you can use `:edit`.

```
:edit file.txt
```

文件名接受通配符，不是作为参数展开，而是按\<Tab\>键展开文件名，可以再按\<Tab\>键进行选择



#### vim原生file explorer netrw操作

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



#### vim语法规则

There is only one grammar rule in Vim language:

```
verb + noun
```



```
y    Yank text (copy)
d    Delete text and save to register
c    Delete text, save to register, and start insert mode
```



#### 文本对象

```
i + object    Inner text object
a + object    Outer text object
```

```
w         A word
p         A paragraph
s         A sentence
( or )    A pair of ( )
{ or }    A pair of { }
[ or ]    A pair of [ ]
< or >    A pair of < >
t         XML tags
"         A pair of " "
'         A Pair of ' '
`         A pair of ` `
```



#### 单词导航

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



#### 行内导航

```
0		跳到本行第一个字符
$		跳到本行最后一个字符

^		跳到本行第一个非空字符
g_      跳到本行最后一个非空字符
```

```
f   在同一行向后搜索第一个匹配
F   在同一行向前搜索第一个匹配

t   在同一行向后搜索第一个匹配，并停在匹配前
T   在同一行向前搜索第一个匹配，并停在匹配前

;   在同一行重复最近一次搜索
,   在同一行向相反方向重复最近一次搜索
```



##### 匹配导航

如果你在它们中的某一对括号中，你可以通过`%`跳到其中一个括号或另一个上(如果存在)。



##### 行号导航

```
gg      跳转到第一行
G       跳转到最后一行
nG      跳转到第n行
n%      跳到文件的n%
CRTL-g  查看文件总行数
```



##### 窗格导航

```
H   跳转到屏幕的顶部
M   跳转到屏幕的中间
L   跳转到屏幕的底部
nH  跳转到距离顶部n行的位置
nL  跳转到距离底部n行的位置
```



##### 滚动

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



##### 搜索导航

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



##### 位置标记

```
ma    用a标签标记一个位置
`a    精确回到a标签的位置(行和列)
'a    跳转到a标签的行
```

`a-z`的标签和`A-Z`的标签存在一个区别，小写字母是局部标签，大写字母是全局标签(也称文件标记)。

我们首先说说局部标记。 每个buffer可以有自己的一套局部标记，如果打开了两个文件，我可以在第一个文件中设置标记"a"(`ma`)，然后在另一个文件中设置另一个标记"a"(`ma`)。

不像你可以在每个buffer中设置一套局部标签，你只能设置一套全局标签。 如果你在`myFile.txt`中设置了标签`mA`，下一次你在另一个文件中设置`mA`时，A标签的位置会被覆盖。 全局标签有一个好处就是，即使你在不同的项目，你也可以跳转到任何一个全局标签上，全局标签可以帮助你在文件间切换。



##### 进入输入模式

```
i    从光标之前的位置开始输入文本
I    从当前行第一个非空字符之前的位置之前开始输入文本
a    在光标之后的位置追加文本
A    在当前行的末尾追加文本
o    在光标位置下方新起一行并开始输入文本
O    在光标位置的上方新起一行并开始输入文本
s    删除当前光标位置的字符并开始输入文本
S    删除当前行并开始输入文本
gi   从当前缓冲区上次结束输入模式的地方开始输入文本
gI   在当前行的第一列的位置开始输入文本
```



##### 退出输入模式(vim原生命令)

```
<esc>     退出输入模式进入普通模式
Ctrl-[    退出输入模式进入普通模式
Ctrl-c    与 Ctrl-[ 和 <esc>功能相同, 但是不检查缩写
```



##### 在输入模式中删除文本

```
Ctrl-h    删除一个字符
Ctrl-w    删除一个单词
Ctrl-u    删除一整行
```

用法感觉是从当前光标往前一个字符、单词、整行



##### 在输入模式下页面滚动

```
Ctrl-x Ctrl-y    向上滚动页面
Ctrl-x Ctrl-e    向下滚动页面
```



##### 自动补全(vim原生自动补全)

```
Ctrl-n             使用下一个匹配的单词进行补全
Ctrl-p             使用上一个匹配的单词进行补全
```



##### 点命令

当你使用普通模式下的命令来更新（添加，修改或者删除）当前缓冲区中的内容时，你就是在执行一个修改操作了。其中的例外是使用命令行命令进行的修改（以`：`开头的命令），这些命令不算作修改操作。

用法举例

比如，如果你想将下面文本中的所有”let“替换为"const"：

```
let one = "1";
let two = "2";
let three = "3";
```

首先，使用`/let`来进行匹配。接着，使用`cwconst<esc>`来将"let"替换成"const"。第三步，使用`n`来找到下一个匹配的位置。最后，使用点命令(`.`)来重复之前的操作。持续地使用`n . n .`直到每一个匹配的词都被替换。

在这个例子里面，点命令重复的是`cwconst<esc>`这一串命令，它能够帮你将需要8次输入的命令简化到只需要敲击一次键盘。



##### 在修改中包含移动操作

让我们来重新回顾一下本章中的第一个例子。这个例子中我们使用了`/letcwconst<esc>`紧接着`n . n .`将下面的文本中的'let'都替换成了'const'。

```
let one = "1";
let two = "2";
let three = "3";
```

其实还有更快的方法来完成整个操作。在删除的时候，并不使用`w`,而是使用`gn`。

```
gn`是向前搜索和上一个搜索的模式（本例中为`/let`）匹配的位置，并且自动对匹配的文本进行可视化模式下的选取的移动操作。想要对下一个匹配的位置进行替换的话，你不再需要先移动在重复修改操作（`n . n .`），而是简单地使用`. .`就能完成。你不需要再进行移动操作了，因为找到下一个匹配的位置并进行选中成为了修改操作的一部分了。完整的命令为`/letdgn..
```

当你在编辑文本时，应该时刻关注像`gn`命令这种能一下子做好几件事的移动操作。



##### 将值放入寄存器的操作

```
y    复制
c    删除文本并进入输入模式
d    删除文本
```

其实还有更多的寄存器写入操作（比如`s`或`x`），但是上面列出的是最常用的一些。根据经验看来，如果一个操作删除了文本，那么很有可能这个操作将移除的文本存入寄存器中了。



##### vim中d x c的区别

d 删除，不能单独用，得跟后续操作符，比如 dd 是删除一整行，d$ 是删除直到行的末尾
x 删除当前光标下的单个字符
c 跟 d 类次，但是删除完成后会进入插入模式

r 更改当前字符

R 从当前字符处开始更改接下来的文本，并进入编辑（应该叫替换模式？）模式



##### 想要从寄存器中取出（粘贴）文本，你可以用以下的命令：

```
p    在光标位置之后粘贴文本
P    在光标位置之前粘贴文本
```

`p`和`P`都可以接受计数和一个寄存器标志作为参数。比如，想要把最近复制的文本粘贴10次的话可以用`10p`。想粘贴寄存器"a"中的文本，可以用`"ap`。想将寄存器“a”中的文本粘贴10次的话，可以使用`10"ap`。

从某个特定寄存器中读取文本的通用语法是`"x`，其中`x`是这个寄存器的标识。



在**输入模式**下使用寄存器

```
Ctrl-r x
```

其中`x`是寄存器标识。



##### 获取寄存器中的内容

你可以使用`:put`命令来粘贴任何寄存器的内容。输出内容将会位于光标处。比如，如果你运行命令`:put a`,Vim就会打印出寄存器"a"的内容，这和`"ap`非常像，唯一的区别在于在普通模式下命令`p`在当前光标位置之后打印寄存器的内容，而`:put`新起一行来打印寄存器的内容。



##### 宏命令的基本用法

宏命令的基本语法如下：

```
qa                     开始记录动作到寄存器 a
q (while recording)    停止记录
```

你可以使用小写字母 （a-z）去存储宏命令。并通过如下的命令去调用：

```
@a    Execute macro from register a
@@    Execute the last executed macros
```



##### 撤销和redo

如果你执行 `u`，Vim 会删除 “two”。 Vim 是如何知道应该恢复多少修改呢？ 答案是，Vim每次仅恢复一次修改，这有点类似于点命令的操作（和 点命令不同之处在于，命令行命令也会被算作一次修改）。

为了取消上一次的撤销，执行 `Ctrl-R` 或者 `:redo`。例如上面的例子中，当你执行撤销来删除 “two” 以后，你可以执行 `Ctrl-R` 来恢复被删除掉的文本。

Vim 也有另一个命令 `U` 可以实现 UNDO 的功能，执行这个命令会撤销所有最新的修改。 那么，`U` 和 `u` 的区别是什么呢？首先，`U` 会删除 *所有的* 最新的修改，而 `u` 一次仅删除一次修改。 其次，执行`u` 不会被算作一次修改，而执行 `U` 则会被算作一次修改。



##### 断点插入操作

如果你执行 `ione two three<esc>` 之后，按下 `u`，Vim 会同时删除 “one two three”，因为这是一笔修改。如果你每次只输入较短的文本，那这是可接受的；可假设你在一次插入模式中输入了大量的文本，而后退出了插入模式，可很快你意识到这中间有部分错误。此时，如果你按下 `u`，你会丢失上一次输入的所有内容。 因此，假设你按下 `u` 只删除你上一次输入的一部分文本岂不是会更好。

幸运的是，你可以拆分它。当你在插入模式时，按下 `Ctrl-G u` 会生成一个断点。例如，如果你执行 `ione <Ctrl-G u>two <Ctrl-G u>three<esc>`，之后你按下`u`，你仅会失去文本 “three”，再次执行 `u`，会删除 “two”。当你想要输入一长段内容时，应该有选择性地执行断点插入操作。在每一句话的末尾，两个段落的中间，或者每一行代码结束时插入断点是一个很好的选择，这可以帮助你快速从错误中恢复出来。



##### 通过映射手动在插入模式的删除操作前添加断点

在执行删除操作后插入断点也非常有用，例如通过 `Ctrl-W` 删除光标前的单词，以及 `Ctrl-U`删除光标前的所有文本。一个朋友建议我使用如下的映射：

```
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>
```

通过上述命令，你可以很轻松地恢复被删除的文本。

插入模式下删除文本

 `Ctrl-W` 删除光标前的单词，以及 `Ctrl-U`删除光标前的所有文本。



##### 保持撤销状态

如果你想要自动加载 undo 历史文件，你可以通过在你的 `.vimrc` 文件中添加如下代码：

```
set undodir=~/.vim/undo_dir
set undofile
```

我认为将所有的 undo 文件集中保存在一个文件夹中最好，例如在 `~/.vim` 目录下。 `undo_dir` 是随意的。 `set undofile` 告诉 Vim 打开 `undofile` 这个特性，因为该特性默认是关闭的。现在，无论你何时保存，Vim 都会自动创建和保存撤销的历史记录（在使用`undo_dir`目录前，请确保你已经创建了它）。



##### 时间旅行

你可以使用 `:undolist` 去查看之前所做的修改。 `:earlier` 可以加上分钟 (`m`), 小时 (`h`), and 天 (`d`) 作为参数。

```
:earlier 10s    恢复到10秒前的状态
:earlier 10m    恢复到10分钟前的状态
:earlier 10h    恢复到10小时前的状态
:earlier 10d    恢复到10天前的状态
```



##### 大小写转换操作

```
gu 选定范围的文本转换为小写
gU 选定范围的文本转换为大写
~ 将光标下的字母改变大小写
```



##### 三种可视模式

```
v         逐字可视模式
V         逐行可视模式
Ctrl-v    逐块可视模式
```



##### 跨多行编辑

您可以使用逐块可视模式在Vim中跨多行编辑文本。如果需要在每行末尾添加分号：

```
const one = "one"
const two = "two"
const three = "three"
```

将光标放在第一行上： -运行逐块可视模式，并向下两行(`Ctrl-V jj`)。 -高亮显示到行尾(`$`)。 -附加(`A`) ，然后键入";"。 -退出可视模式(`esc`)。



#### chapter12



##### 在搜索中手动指定大小写

如果执行`/\Chello`，它将严格匹配"hello"，而不是"HELLO"或"Hello"。



##### 替代

Vim 的替代命令是一个有用的命令，用于快速查找和替换任何模式。 替换语法为:

```
:s/old-pattern/new-pattern/
```

问题是只在行内有效？



##### 重复最后一次替换

可以使用普通命令`&`或运行`:s`来重复最后一个替代命令。 如果您刚刚运行`:s/good/awesome/`，则运行`&`或`:s`都会重复执行。



##### 设置替代范围

就像许多 Ex 命令一样，您可以将 range 参数传递给替代命令。 语法为:

```
:[range]s/old/new/
```

```
:3,5s/let/const/
```

替代命令的范围语法与搜索（`{n,m}`）中的计数语法相似，但有细微差别。 这是通过范围的一些变化:

- `:,3/let/const/` - 如果逗号前没有给出任何内容，则表示当前行。 从当前行替换为第 3 行。
- `:1,s/let/const/` - 如果逗号后没有给出任何内容，则它也代表当前行。 从第 1 行替换为当前行。
- `:3s/let/const/` - 如果仅给出一个值作为范围（不带逗号），则仅在该行进行替换。

在 Vim 中，`%`通常表示整个文件。 如果运行`:%s/let/const/`，它将在所有行上进行替换。



##### 更改定界符

举例如下：

如果您需要用长路径替换 URL:

```
https://mysite.com/a/b/c/d/e
```

要用单词"hello"代替它，请运行:

```
:s/https:\/\/mysite.com\/a\/b\/c\/d\/e/hello/
```

但是，很难说出哪些正斜杠（`/`）是替换模式的一部分，哪些是分隔符。 您可以使用任何单字节字符（除字母，数字或`“`，`|`和`\`之外的字符）来更改定界符。让我们将它们替换为`+`。上面的替换命令可以重写为 :

```
:s+https:\/\/mysite.com\/a\/b\/c\/d\/e+hello+
```

现在，更容易看到分隔符在哪里。



#### chapter13



##### 全局命令

Vim的全局命令用于同时在多行上运行命令行命令。

全局命令具有以下语法：

```
:g/pattern/command
```

`pattern`匹配包含该模式的所有行，类似于替代命令中的模式。`command`可以是任何命令行命令。全局命令通过对与`pattern`匹配的每一行执行`command`来工作。



##### 逆向匹配

要在不匹配的行上运行全局命令，可以运行：

```
:g!/{pattern}/{command}
```

要么

```
:v/{pattern}/{command}
```



##### 在全局命令的command部分使用普通命令

举例如下

要添加";"运行到每一行的末尾：

```
:g/./normal A;
```

让我们分解一下：

- `:g` 是全局命令。
- `/./` 是“非空行”的模式。回想一下正则表达式中的点（`.`）表示*任何字符*。它将行与至少一个字符匹配，因此将行与“const”和“console”匹配。它不匹配空行。
- `normal A;` 运行`:normal`命令行命令。 `A;` 是普通模式命令，用于在该行的末尾插入";"。



##### 在全局命令的command部分执行宏

可以使用全局命令执行宏。宏只是普通模式下的操作，因此可以使用`:normal`来执行宏。

举例如下：

```
:g/const/normal @a
```



##### 递归全局命令

举例如下：

如果您运行：

```
:g/console/g/two/d
```

首先，“g”将查找包含模式“console”的行，并找到3个匹配项。然后，第二个“g”将从那三个匹配项中查找包含模式“two”的行。最后，它将删除该匹配项。

您也可以将“g”与“v”结合使用以找到正负模式。例如：

```
:g/console/v/two/d
```

而不是查找包含模式"two"的行，它将查找*不*包含"two"的行。



##### 全局命令的默认命令

当运行

```
:g/console
```

vim将在屏幕底部打印所有包含"console"的行。

顺便说一下，这是一个有趣的事实。因为全局命令使用的默认命令是`p`，所以这使`g`语法为：

```
:g/re/p
```

- `g` = 全局命令
- `re` = 正则表达式模式
- `p` = 打印命令

它拼写作"grep"，与命令行中的`grep` 相同。但这 **不** 是巧合。 `g/re/p`命令最初来自第一行文本编辑器之一的Ed编辑器。 `grep`命令的名称来自Ed。



#### chapter14



##### 爆炸命令（bang command)

Vim有一个爆炸(`!`)命令，可以执行三件事：

1.将外部命令的STDOUT读入当前缓冲区。 2.将缓冲区的内容作为STDIN写入外部命令。 3.从Vim内部执行外部命令。



##### 1.将外部命令的stdout读入当前缓冲区

将外部命令的STDOUT读入当前缓冲区的语法为：

```
:r !{cmd}
```

`:r`是Vim的读命令。如果不带`!`使用它，则可以使用它来获取文件的内容。如果当前目录中有文件`file1.txt`并运行：

```
:r file1.txt
```

注意，和:edit区别是:edit更换当前缓冲区的整个内容，:r是将file1.txt的内容追加到光标后面

r命令也接受一个地址：

```
:10r !cat file1.txt
```

现在，将在第10行之后插入来自运行`cat file.txt`的STDOUT。

##### 2.将缓冲区的内容写入外部命令

除了保存文件，您还可以使用写命令(`:w`)将当前缓冲区中的文本作为STDIN传递给外部命令。语法为：

```
:w !cmd
```

当使用`：w`命令时，Vim使用当前缓冲区中的所有文本，与global命令类似（大多数命令行命令，如果不给它传递范围，则仅对当前行执行该命令）。如果您通过`：w`来指定地址：

```
:2w !node
```

##### 3.执行外部命令

您可以使用bang命令从Vim内部执行外部命令。语法为：

```
:!cmd
```

您可以在不离开Vim的情况下运行任何外部命令，因此您可以专注于自己的任务。



##### 普通模式命令

在正常模式下，Vim有一个过滤运算符（`!`）。如果您有以下问候：

```
hello vim
hola vim
bonjour vim
salve vim
```

要大写当前行和下面的行，可以运行：

```
!jtr '[a-z]' '[A-Z]'
```

细目：

- `!j` 运行常规命令过滤器运算符（`!`），目标是当前行及其下方的行。回想一下，因为它是普通模式运算符，所以适用语法规则“动词+名词”。
- `tr '[a-z]' '[A-Z]'`将小写字母替换为大写字母。

filter normal命令仅适用于至少一行或更长的运动/文本对象。如果您尝试运行`!iwtr'[az]''[AZ]'`（在内部单词上执行`tr`），您会发现它在整个行上都应用了tr命令，而不是光标所在的单词开启。

（该部分普通模式命令有待继续阅读）



#### chapter 16



##### 进入和推出命令行模式

命令行模式也称"Ex 命令"，外部命令也称"过滤命令"

命令行模式本身也是一种模式，就像普通模式、输入模式、可视模式一样。在这种模式中，光标将转到屏幕底部，此时您可以输入不同的命令。

有 4 种进入命令行模式的方式：

- 搜索命令 (`/`, `?`)
- 命令行指令 (`:`)
- 外部命令 (`!`)

您可以从正常模式或可视模式进入命令行模式。

若要离开命令行模式，您可以使用 `<esc>`、`Ctrl-c`、`Ctrl-[`。



##### 重复上一次命令

您可以用 `@:` 来重复上一个命令行指令或外部命令。



##### 命令行模式快捷键

和输入模式类似，在命令行模式中，有三种方法可以删除字符：

```
Ctrl-h    删除一个字符
Ctrl-w    删除一个单词
Ctrl-u    删除一整行
```

 ```
Ctrl-b    移动到该行的开始
Ctrl-e    移动到该行的结束
 ```



##### 插入寄存器中的值

可以使用 `Ctrl-r` 来插入 Vim 寄存器中的文本（就和输入模式中的一样）。如果寄存器 "a 中存储着 "foo" 字符串，运行 `Ctrl-r a` 就可以插入它。



