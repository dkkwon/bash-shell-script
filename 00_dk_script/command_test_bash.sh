#! /bin/bash
# ref - "The Linux Command Line: a complete introduction"

# [[ ]]: regular exp

FILE=$(ls)
echo "$FILE"

for file in $FILE; do
    if [[ $file == *.sh ]]; then
        echo "$file is shell script!"
    else
        echo "$file is not shell script"
    fi
done

# (( )): INT Test

INT=-5
if (($INT < 0)); then
    echo "$INT is negative"
fi
