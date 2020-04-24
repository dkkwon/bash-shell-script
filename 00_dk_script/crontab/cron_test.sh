#! /bin/bash

set -x

cd "$(dirname "$0")" || exit

echo "chon_test : $(date +'%Y-%m-%d:%H:%M:%S')" >>cron_test.log
