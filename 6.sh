#!/bin/bash
#перенос базы данных в Amozon EC2
# Connect to Salesforce and export data to a CSV file
salesforce_query="SELECT * FROM Your_Object"
salesforce_data=$(sfdx force:data:tree:export -q "$salesforce_query" --outputdir ./data)

# индификация 
scp -i path/to/your/key.pem ./data/Your_Object.csv ubuntu@ec2-instance-address:~/

# подключение к Amazon EC2  и импорт базы данных
ssh -i path/to/your/key.pem ubuntu@ec2-instance-address << EOF
  sudo -u postgres psql -c "CREATE TABLE Your_Object (field1 text, field2 text, ...);"
  sudo -u postgres psql -c "\copy Your_Object FROM '~/Your_Object.csv' DELIMITER ',' CSV HEADER;"
EOF
