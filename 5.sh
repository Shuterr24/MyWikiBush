#!/bin/bash
#скрипт копирования файлай с использыванием контрольной суммы 
# Определение переменных удаленный сервер, локальная директори, удаленная директория, фаил контрольной суммы
remote_server="user@amazon_ec2_ip"
local_folder="./folder_to_copy"
remote_folder="/path/to/remote/folder"
checksum_file="checksum.md5"

# Генерируем md5 суммы для каждого файла в локальной папке
cd $local_folder
md5sum * > $checksum_file

# Копируем файлы и файл суммы на удаленный сервер
scp -r $local_folder/* $remote_server:$remote_folder
scp $checksum_file $remote_server:$remote_folder

# Вычисляем md5 суммы для каждого файла на удаленном сервере
ssh $remote_server "cd $remote_folder; md5sum -c $checksum_file"
