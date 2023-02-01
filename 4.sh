#!/bin/bash
#передача директории на aws ec2
# вводим адрес AWS EC2 
instance="your-instance-dns-or-ip"

# выбираем local directory для передачи
local_dir="/path/to/local/directory"

# выбрать удаленную directory to transfer to
remote_dir="/path/to/remote/directory"

# key для аунтификации 
rsync -avz -e "ssh -i /path/to/key.pem" "$local_dir" "ec2-user@$instance:$remote_dir"

# Confirm successful transfer
if [ $? -eq 0 ]; then
  echo "Data transfer successful"
else
  echo "Data transfer failed"
fi

