#! /bin/bash

# https://mug896.github.io/bash-shell/read.html

# read [-ers] [-a array] [-d delim] [-i text] [-n nchars] [-N nchars] [-p prompt] [-t timeout] [-u fd] [name ...]
# read 명령은 stdin 로부터 라인을 읽어들여서 IFS 에 따라 값을 분리한 다음 지정한 [name ...] 에 할당합니다.

# set -x

# # name 이 단어 개수보다 적을경우 마지막 name 에 나머지를 할당
# read v1 v2 v3 <<< "1 2 3 4 5"
# echo $v3

# <<< : here document
IFS=':|@' read c1 c2 c3 c4 <<<"red:green|blue@white"
printf "c1: %s, c2: %s, c3: %s, c4: %s\n" "$c1" "$c2" "$c3" "$c4"

# 파이프에 연결된 명령은 subshell 에서 실행되므로 다음과 같이 할 수 없습니다.
echo 1 2 3 4 5 | read v1 v2 v3
echo $v1 $v2 $v3

# 명령 group 을 이용하면 값을 표시할 수 있습니다.
echo 1 2 3 4 5 | {
    read v1 v2 v3
    echo $v1 $v2 $v3
}

# here document 를 이용하는 방법
read b1 b2 b3 <<END
1 2 3 4 5
END
echo $b1 $b2 $b3

# -r : 읽어 들이는 데이터에서 \ 문자를 이용한 escape 을 disable 합니다 (raw read).
read v <<<'xxx\t\nyyy' # -r 옵션 미사용
echo "$v"
read -r v <<<'xxx\t\nyyy' # -r 옵션 사용
echo "$v"
echo -e "$v"

# -d delim : 라인 구분자를 의미하며 기본적으로 newline 입니다.
# -d 값을 null 로 설정하면 파일 전체 라인을 읽어 들입니다.
read -r whole <data_read.txt
echo $whole
read -r -d '' whole <data_read.txt
echo $whole

IFS=, read -r -a arr <<<"1,2,3,4,5,"
echo ${#arr[@]}
echo ${arr[@]}

# -p prompt : 사용자에게 값을 입력받을때 prompt 를 설정할 수 있습니다. ( 프롬프트가 표시될 때는 stderr 로 출력됩니다. )
# -e : 사용자에게 값을 입력받을때 readline 을 사용합니다. ??)
# -i text : -e 옵션과 같이 사용하며, 초기 입력값을 설정할 수 있습니다.
# -s : 사용자에게 값을 입력받을때 타입 한 값을 화면에 표시하지 않습니다.
# -n nchars : nchars 만큼 문자를 읽어 들입니다. 중간에 라인 구분자를 만나면 중단합니다.
# -N nchars : 라인 구분자를 상관하지 않고 무조건 nchars 만큼 읽어 들입니다.
# -t timeout : 사용자에게 입력을 받을 때 timeout 값을 설정할 수 있습니다.

# read -p "Enter the path to the file: " reply
# read -rp "Enter the path to the file: " -ei "/usr/local/" reply
read -r -p "Enter the path to the file: " -t1.5 -N15 -ei "/usr/local/" reply
echo "$reply"


# 1. IFS='' 로 설정하여 라인의 앞, 뒤에 존재하는 공백을 유지합니다.
# 2. -r 옵션을 설정하여 '\' 문자의 escape 이 처리되지 않게 합니다.
# 3. || [ -n "$line" ] 을 추가하여 파일 끝에 newline 이 존재하지 않아
#    오류가 발생할시 처리될수 있게 합니다.

echo "IFS: $IFS"

echo -en ' 111  11\n  222 22\n   333\n    444\n     555' > file
while read -r line; do echo "$line"; done < file; echo    
while IFS= read -r line; do echo "$line"; done < file; echo
while IFS= read -r line || [ -n "$line" ]; do echo "$line"; done < file