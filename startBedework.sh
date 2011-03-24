#!/bin/bash

BEDE_HOME=~/bedework/quickstart-3.7

cd $BEDE_HOME
nohup ./bw -bwchome $BEDE_HOME/bedework/config/bwbuild -bwc jboss-mysql dirstart > logs/apacheds.log 2>&1 &
nohup ./startjboss -debug > logs/jboss.log 2>&1 &

echo "Server started, check logs in $BEDE_HOME/logs"


