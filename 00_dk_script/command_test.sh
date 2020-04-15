#! /bin/sh

FILE=./multiple_augument.sh

if test ! -f $FILE; then echo "test -e $FILE"; fi

# AND:  -a or && (bash)
# OR:   -o or || (bash)
# NOT:  !

MIN=1
MAX=100

read -rp "Enter integer:" INT
: ${INT:=10}

if [ $INT -ge $MIN -a $INT -le $MAX ]; then
    echo "$INT -ge $MIN -a $INT -le $MAX"
fi

if [ $INT -ge $MAX -o $INT -le $MIN ]; then
    echo "$INT -ge $MAX -o $INT -le $MIN"
fi
