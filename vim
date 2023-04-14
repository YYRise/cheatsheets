---
tags: [ vim ]
---

# File management

:e              reload file
:q              quit
:q!             quit without saving changes
:w              write file
:w {file}       write new file
:x              write file and exit

# Movement

    k
  h   l         basic motion
    j

w               next start of word
W               next start of whitespace-delimited word
e               next end of word
E               next end of whitespace-delimited word
b               previous start of word
B               previous start of whitespace-delimited word
0               start of line
$               end of line
gg              go to first line in file
G               go to end of file
gk		        move down one displayed line
gj		        move up one displayed line

# Preceding a motion or edition with a number repeats it 'n' times
# Examples:
50k         moves 50 lines up
2dw         deletes 2 words
5yy         copies 5 lines
42G         go to line 42

# Insertion
#   To exit from insert mode use Esc or Ctrl-C
#   Enter insertion mode and:

a               append after the cursor
A               append at the end of the line
i               insert before the cursor
I               insert at the beginning of the line
o               create a new line under the cursor
O               create a new line above the cursor
R               enter insert mode but replace instead of inserting chars
:r {file}       insert from file

# Editing

u               undo
yy              yank (copy) a line
y{motion}       yank text that {motion} moves over
p               paste after cursor
P               paste before cursor
<Del> or x      delete a character
dd              delete a line
d{motion}       delete text that {motion} moves over

# 查找替换 `:substitute` (aka `:s`) command
格式:[range]s/{pattern}/{string}/[flags]

# range 取值
空:		默认光标所在的行；
%:		表示整个文件
.:		光标所在的行
1:		第一行
$:		最后一行
.+1:	光标下一行
$-1:	倒数第二行
22,25:	第22~25行
.,$:	当前行到最后一行

# flags 取值
g:	对指定范围内的所有匹配项进行替换
c:	在替换前请求用户确认
e:	忽略执行过程中的错误

string: 省略的话删除与parrern匹配的字符串；

:s/foo//g			# 将光标当前行的foo替换为空字符串
:s/foo/bar/			# replace the first match of 'foo' with 'bar' on the current line only
:s/foo/bar/g	    # replace all matches (`g` flag) of 'foo' with 'bar' on the current line only
:%s/foo/bar/g	    # replace all matches of 'foo' with 'bar' in the entire file (`:%s`)
:%s/foo/bar/gc	    # ask to manually confirm (`c` flag) each replacement；c:交互模式
:3,10s/foo/bar/g    # 指定绝对行号的命令。将从第3行到第10行中与模式foo匹配的项替换为bar。
:.,$s/foo/bar/g	    # 点.字符表示光标所在行，而$美元符号表示最后一行。将会从光标所在行到最后一行中搜索foo模式然后替换为 bar
:.,+4s/foo/bar/g    # 表示从光标所在行开始搜索，并在光标所在行加4行然后结束搜索模式foo，并用bar替换与模式匹配的项。
:s/Foo/bar/gi	    # 在当前行忽略大小写进行搜索
:s/Foo\c/bar/g	    # 在当前行忽略大小写进行搜索
:5,20s/^/#/			# 在5到20行前添加#,恢复之前的更改，运行命令:5,20s/^#//
:%s/app|or|ma/f/g   # 在整个文件搜索app，or和ma，然后使用f替换与模式匹配的项。
:%s/\s+$//e			# 这是一个非常有用的命令，它将在整个文件中搜索末尾的空白符并删除。\s是正则表达式，匹配所有空白符，+表示一个或者多个，$表示行尾


ggdG	    删除所有内容

# Multiple windows
:e filename      - edit another file
:split filename  - split window and load another file
ctrl-w up arrow  - move cursor up a window
ctrl-w ctrl-w    - move cursor to another window (cycle)
ctrl-w_          - maximize current window
ctrl-w=          - make all equal size
10 ctrl-w+       - increase window size by 10 lines
:vsplit file     - vertical split
:sview file      - same as split, but readonly
:hide            - close current window
:only            - keep only this window open
:ls              - show current buffers
:.! <command>    - shell out

# Buffers
# move to N, next, previous, first last buffers
:bn              - goes to next buffer
:bp              - goes to prev buffer
:bf              - goes to first buffer
:bl              - goes to last buffer
:b 2             - open buffer #2 in this window
:new             - open a new buffer
:vnew            - open a new vertical buffer
:bd 2            - deletes buffer 2
:wall            - writes all buffers
:ball            - open a window for all buffers
:bunload         - removes buffer from window
:taball          - open a tab for all buffers

# Pointers back
ctrl-o

# Pointers forward
ctrl-o

# Super search
ctrl-p

# To sort  a visual range on column 1 as a number:
:'<,'>!sort -gk 1 -t ,

# Map (in normal mode) the F2 key to a bash call `uuidgen`, then trim the `\n`
# from the result, and put that in the expression register `"=`, then put that
# before the cursor:
nmap <F2> "= system("uuidgen")[:-2]<C-M>P

# global
命令格式 : [range]global/{pattern}/{command}
# global命令在[range]指定的文本范围内（缺省为整个文件）查找{pattern}可以是正则表达式，
# 然后对匹配到的行执行命令{command}，如果希望对没匹配上的行执行命令，则使用global!或vglobal命令。

# Delete every line that has a FOO in it. See `:help global`.
# The _ in the d _ command ensures registers and clipboards are not changed.
:g/FOO/d _      # 删除包含FOO的行
:g!/aaa/d       # 删除不包含某字段(例如aaa)的行
:x,.d           # 从ｘ行删除到当前行；
:.,xd           # 从当前行删除到x行；
:g/^\s*$/d      #  删除只有空白的行
