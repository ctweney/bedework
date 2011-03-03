#!/bin/bash

BEDE_HOME=~/bedework/quickstart-3.7

cd ~-
git pull

cd $BEDE_HOME
cp -R ~/quickstart_customizations/* .
./bw -bwchome $BEDE_HOME/bedework/config/bwbuild -bwc default deploy.debug


