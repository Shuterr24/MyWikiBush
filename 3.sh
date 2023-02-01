#!/bin/bash

#копирование данных на сервер по ftpv

# данные для индефикации 
source_server="source.server.com"
destination_server="destination.server.com"
username="user"
password="secret"

# копирование с изспользывнием команлы  ftp 
#данные исхлдношо сревера
ftp -inv $source_server << EOF
user $username $password
bin
get file.txt
quit
EOF

#данные удаленного сервера
ftp -inv $destination_server << EOF
user $username $password
bin
put file.txt
quit
EOF
