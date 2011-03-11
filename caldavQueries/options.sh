#!/bin/bash

SERVER_URL="http://test.media.berkeley.edu:8080/ucaldav/user/vbede/calendar/"
USER_PASS="vbede:bedework"

curl -v -i -u $USER_PASS -X OPTIONS $SERVER_URL -H "Depth: infinity"
