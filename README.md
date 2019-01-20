# README
## What does this mini-project does ?
This project works like a mini-cat, but instead of displaying normally the content of files, it displays the content of a file in rot13.

## Why mini-cat ?
You can only give files as arguments to display them.  
Good example: `./cat my_file`  
Giving files as input will not work on this mini-cat.  
Bad example: `./cat < my_file`

## Why in x86_64 ?
Why not ?

## What can it do ?
* Display one file in rot13
* Display multiple files in rot13
* Display an error in case of a file not existing

## Different rules (build the project, clean the repo)
* make: build the project and create the binary cat
* make all: same as make
* make clean: remove all the files create by make
* make cl: same as make clean
