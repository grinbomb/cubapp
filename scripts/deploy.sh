#!/usr/bin/env bash

mvn clean package

echo 'Copy files...'

scp -i ~/.ssh/id_rsa \
    target/cub-app-0.0.1-SNAPSHOT.jar \
    ngm@192.168.0.102:/home/ngm/

echo 'Restart server...'

ssh -i ~/.ssh/id_rsa ngm@192.168.0.102 << EOF
pgrep java | xargs kill -9
nohup java -jar cub-app-0.0.1-SNAPSHOT.jar > log.txt &
EOF

echo 'Bye'