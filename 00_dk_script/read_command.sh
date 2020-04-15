#!/bin/bash
# https://wiki.kldp.org/HOWTO/html/Adv-Bash-Scr-HOWTO/subshells.html
# https://mug896.github.io/bash-shell/subshells.html

OLD_IFS="$IFS"
echo "$IFS"

# read-ifs: read fields from a file
FILE=/etc/passwd
read -p "Enter a username > " user_name
file_info=$(grep "^$user_name:" $FILE)

: > tmp.txt
echo "$file_info" > tmp.txt

# >>>(here string): working on bash
# read command can't use with pipe --> check subshell 

if [ -n "$file_info" ]; then
    IFS=":" 
    read user pw uid gid name home shell <<<"$file_info"            # working
    # read user pw uid gid name home shell < tmp.txt                # working
    # echo -n "$file_info" | read user pw uid gid name home shell   # not working
    echo "User =      '$user'"
    echo "UID =       '$uid'"
    echo "GID =       '$gid'"
    echo "Full Name = '$name'"
    echo "Home Dir. = '$home'"
    echo "Shell =     '$shell'"
else
    echo "No such user '$user_name'"
    exit 1
fi
