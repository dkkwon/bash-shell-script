#!/bin/sh

# Use:

# If the intention is to concatenate all the array elements into one argument, use $*
TMP=$1
echo "\$1: $TMP" "\$@: $@"
echo "\$1: $TMP" "\$*: $*"

for opt in "$@"; do
  case "$opt" in
  -d | --dir)
    echo "-d|--dir) : $opt"
    ;;
  -m | --move)
    echo "-m|--move) : $opt"
    ;;
  *)
    echo "Unknown Type: $opt"
    ;;
  esac
done

## .sh: need read/execute mode
## others: just need execute mode
