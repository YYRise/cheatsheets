# Sed是Stream EDitor的缩写
# -i 表示直接进行文件操作，而不在终端上显示结果

# 删除第1行/最后1行/5到8行/第1、第5和最后一行/除第3到6行以外的其他行
sed -i '1d'/'$d'/'5,8d'/'1d;5d;$d'/'3,6!d' <file>

# 配合逻辑非 ! 使用，删除第3到6行以外的其他行
sed -i '3,6!d' <file>

# 删除在 1 到 6 行内有 Linux 这个词的内容
sed -i '1,6{/Linux/d;}' <file>

# 有 System 或 Linux 的行
sed -i '/System\|Linux/d' <file>

# To replace all occurrences of "day" with "night" and write to stdout:
sed 's/day/night/g' <file>

# To replace all occurrences of "day" with "night" within <file>:
sed -i 's/day/night/g' <file>

# To replace all occurrences of "day" with "night" on stdin:
echo 'It is daytime' | sed 's/day/night/g'

# To remove leading spaces:
sed -i -r 's/^\s+//g' <file>

# To remove empty lines and print results to stdout:
sed '/^$/d' <file>

# To replace newlines in multiple lines:
sed ':a;N;$!ba;s/\n//g' <file>

# To insert a line before a matching pattern:
sed '/Once upon a time/i\Chapter 1'

# To add a line after a matching pattern:
sed '/happily ever after/a\The end.'
