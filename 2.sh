#!/bin/bash

#Перенос  файлов с использованием curl

# Массив данных, которые нужно передать
data=("file1.txt" "file2.txt" "file3.txt")

# Цикл по всем файлам в массиве
for file in "${data[@]}"; do
  # Использование команды curl для передачи файла
  curl -T "$file" ftp://user:password@remote_server/destination_directory/
done

# Вывод сообщения о завершении передачи данных
echo "Передача данных завершена."
