#!/bin/bash
# https://blog.gaerae.com/2015/01/bash-hello-world.html

# For me
set -oux

# 스크립트 실행없이 단순 문법 오류만 검사(찾지 못하는 문법 오류가 있을수 있음)
bash -n
set -n, set -o noexec

# 명령어 실행전 해당 명령어 출력(echo)
bash -v
set -v, set -o verbose

# 명령어 실행후 해당 명령어 출력(echo)
bash -x
set -x, set -o xtrace

# 미선언된 변수 발견시 "unbound variable" 메시지 출력
set -u, set -o nounset
