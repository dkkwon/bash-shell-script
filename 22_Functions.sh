#! /bin/bash

# Funtions ? 
# https://mug896.github.io/bash-shell/functions.html

# { ;} 은 현재 shell 에서 ( ), | 는 subshell 에서 실행

set -v

$ echo hello world | read var; echo "$var"
$ echo hello world | { read var; echo "$var" ;}


$ echo hello; echo world > outfile1
$ { echo hello; echo world ; } > outfile2


$ time sleep 2 && sleep 3
$ time { sleep 2 && sleep 3 ;}