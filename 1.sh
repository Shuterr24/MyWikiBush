#!/bin/bash
#bash-скрипт, который переносит массив данных с одного сервера на другой с помощью scp

data=("файл1.txt" "файл2.txt" "файл3.txt")

for файл in "${data[@]}"; do
  scp "$файл" пользователь@удаленный_сервер:/каталог_назначения/
done

echo "Передача данных завершена."
