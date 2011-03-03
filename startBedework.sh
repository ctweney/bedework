#!/bin/bash

cd ~/bedework/quickstart-3.7
nohup ./bw -bwc default dirstart > logs/apacheds.log 2>&1 &
nohup ./startjboss > logs/jboss.log 2>&1 &

echo "Server started, check logs in ~/bedework/quickstart-3.7/logs"


