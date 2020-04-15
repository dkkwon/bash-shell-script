#!/bin/bash

# https://mug896.github.io/bash-shell/subshells.html
# $ ( sleep 10; echo )                        # 1.  ( ) , $( )
# $ `sleep 10; echo`                          # 2.  ` ` backtick 명령치환
# $ echo | { sleep 10; echo ;}                # 3.   |  파이프
# $ command &                                 # 4. background 로 실행되는 명령


# https://wiki.kldp.org/HOWTO/html/Adv-Bash-Scr-HOWTO/subshells.html
echo

outer_variable=Outer

(
inner_variable=Inner
echo "서브쉘의 \"inner_variable\" = $inner_variable"
echo "서브쉘의 \"outer\" = $outer_variable"
)

echo

if [ -z "$inner_variable" ]
then
  echo "inner_variable 은 쉘의 메인에서 정의되지 않았습니다."
else
  echo "inner_variable 은 쉘의 메인에서 정의되었습니다."
fi

echo "쉘 메인의 \"inner_variable\" = $inner_variable"
# $inner_variable 은 초기화되지 않은 것처럼 보이는데,
# 서브쉘에서 정의된 변수는 그 서브쉘의 "지역 변수"이기 때문입니다.

echo

FILE=.bashrc  #  사용자 프로파일을 담고 있는 파일.
              #+ 원래 스크립트에서는 ".profile" 이었습니다.

for home in `awk -F: '{print $6}' /etc/passwd`
do
  [ -d "$home" ] || continue    # 홈 디렉토리가 없는 사용자라면 다음으로 넘어감.
  [ -r "$home" ] || continue    # 읽을수 없는 홈디렉토리라면 역시 그냥 넘어감.
  (cd $home; [ -e $FILE ] && cat $FILE)
done

# 'cd $home' 이 서브쉘에서 돌기 때문에,
#+ 스크립트가 끝난 다음, 'cd'를 써서 원래 디렉토리로 다시 돌아갈 필요가 없습니다.