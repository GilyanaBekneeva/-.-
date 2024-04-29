#!/bin/bash

a=$1
b=$2

echo "выводим список файлов во входной директории"
find "$a" -maxdepth 1 -type f | while read line
do
filename=${line##*/}
echo $filename
done
echo "выводим список директорий во входной директории"
find "$a" -maxdepth 1 -type d -not -name "${a##*/}" | while read line
do
dirname=${line##*/}
echo $dirname
done
find "$a" -type f | while read line
do
filename=${line##*/}
count=0
while [[ -f "$b"/"$filename" ]]
do
filename="${filename%.*}"$count."${filename##*.}"
count=$(($count+1))
done
cp "$line" "$b"/"$filename"
done
echo "все файлы скопированы успешно"
