#! /bin/bash

# Quotes ? 
# https://mug896.github.io/bash-shell/quotes.html

# escape 란? 
# https://mug896.github.io/bash-shell/escape_sequences.html

set -x

# escape : '' or \
touch aaa.log bbb.bak
find -- * -type f '(' -name "*.log" -or -name "*.bak" ')'
find ./* -type f \( -name "*.log" -or -name "*.bak" \) -exec rm -vf {} \;
'grep' 2015-07 data.txt

# no quotes 
echo -e foo\tbar\n123 # 모든 문자가 escape 되므로 t n 이 echo 명령에 전달된다.
echo -e foo\\tbar\\n123

# ! history 확장 escape
# echo !!

# 행의 마지막에 \ 를 붙이고 개행을 하면 \newline 과 같이 되어 newline 을 escape 한 결과를 같습니다. (\ 뒤에 다른 문자가 오면 안됨)
echo "I like \
winter and \
snow"

# Double quotes ( " " ) :  $ ` ! newline 특수기능 실행, 공백과 개행이 유지
# Single quotes : 문자 그대로 출력

echo '\$'     # single quotes
echo "\$"     # double quotes 에서는 특수 기능을 하는 '$' 문자가 escape 된다. 

echo '\`'
echo "\`"

echo '\\'
echo "\\"

echo 'quotes\
test'
echo "quotes\
test"

# Double quotes ( " " ) && Array
# "$@", "$*" positional parameters 동일 적용
arr=( 1 2 3 )
echo ${arr[@]}
echo "${arr[@]}"       # "${arr[0]}" "${arr[1]}" "${arr[2]}" ... 

echo ${arr[*]}
echo "${arr[*]}"        # "${arr[0]}X${arr[1]}X${arr[2]}X..." 여기서 X 는 IFS 값의 첫번째 문자

TMP=""
echo 1 2 $TMP 3
echo 1 2 "$TMP" 3

# $'  ' : ' ' 와 같은데 escape 문자를 사용
