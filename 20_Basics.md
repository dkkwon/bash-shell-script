## What is shell ?
```
$ echo $SHELL
```
- sh, bash (Linux, MAC), tsch (FreeBSD), zsh
- prompt: $, #

## Teminal? 
- tty(teletype)? 
- Terminal Emulator? 
- Virtual Terminal?
- Emulator vs Simulator 

## [Command?](https://mug896.github.io/bash-shell/basics.html)
- command type
    - ddd
- filename (exception: NUL, /)
- command, space, assignment operator
- exit status, $?, return
- command block, '{','}', space, ;
- subshell, '(',')'
- word seperation, IFS (Internal Field Seperator)
- globbing(filename expansion), command substitution
- escape('\'), quote("", '')
- STDIO('-')
- cd <directory> &&, || exit
- $
    - agument expansion
    - arithmatic expantion
    - command substitution
- [special chracters](https://www.oreilly.com/library/view/learning-the-bash/1565923472/ch01s09.html) 

## Option
### short option
- ls -a -l -al
- ls -al 
### long option (GNU) 
- ls --color
### not option
- ls -- -sample.txt

## Argument
- command line argument
- argument vs varialbe

