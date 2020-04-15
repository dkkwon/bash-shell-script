#! /bin/bash

# https://mug896.github.io/bash-shell/getopts.html


# short 옵션의 특징


# # 옵션을 붙여서 사용할 수 있으며 순서가 바뀌어도 된다.
# $ command -abc
# $ command -b -ca

# # 옵션인수를 가질 수 있다.
# $ command -a xxx -b -c yyy
# $ command -axxx -bcyyy

# # 옵션 구분자 '--' 가 올경우 우측에 있는 값은 옵션으로 해석하면 안된다.
# $ command -a -b -- -c


# Option string 과 $OPTIND
# shell 이 처음 실행되면 $OPTIND 값은 1 을 가리키고 getopts 명령이 실행될 때마다 다음 옵션의 index 값을 가리키게 됩니다.

set -- -abc hello world     # 다 "command -a -bc hello world" 명령을 실행했을 때와 같이 positional parameters 를 설정

echo $OPTIND

getopts abc opt 
echo $opt, $OPTIND 

getopts abc opt 
echo $opt, $OPTIND

getopts abc opt  
echo $opt, $OPTIND

shift $(( OPTIND - 1 ))
echo "$@"

# Option argument