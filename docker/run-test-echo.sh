#!/bin/bash

# 可运行
# Executable

# echo(选项)(参数)选项

# -e：激活转义字符。使用-e选项时，若字符串中出现以下字符，则特别加以处理，而不会将它当成一般文字输出：

# \a 发出警告声
# \b 删除前一个字符
# \c 最后不加上换行符号
# \f 换行但光标仍旧停留在原来的位置
# \n 换行且光标移至行首
# \r 光标移至行首，但不换行
# \t 插入tab
# \v 与\f相同
# \\ 插入\字符
# \nnn 插入nnn（八进制）所代表的ASCII字符

echo -e "\033[30mTest 30\033[0m"
echo -e "\033[31mTest 31\033[0m"
echo -e "\033[32mTest 32\033[0m"
echo -e "\033[33mTest 33\033[0m"
echo -e "\033[34mTest 34\033[0m"
echo -e "\033[35mTest 35\033[0m"
echo -e "\033[36mTest 36\033[0m"
echo -e "\033[37mTest 37\033[0m"
echo ""
echo -e "\033[40mTest 40\033[0m"
echo -e "\033[41mTest 41\033[0m"
echo -e "\033[42mTest 42\033[0m"
echo -e "\033[43mTest 43\033[0m"
echo -e "\033[44mTest 44\033[0m"
echo -e "\033[45mTest 45\033[0m"
echo -e "\033[46mTest 46\033[0m"
echo -e "\033[47mTest 47\033[0m"