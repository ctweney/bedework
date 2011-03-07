#!/bin/bash

SERVER_URL="http://test.media.berkeley.edu:8080/ucaldav/user/vbede/calendar/"
USER_PASS="vbede:bedework"

XML='<?xml version="1.0" encoding="utf-8"?>
<x0:propfind xmlns:x0="DAV:" xmlns:x1="http://calendarserver.org/ns/">
 <x0:prop>
  <x0:getetag/>
  <x0:resourcetype/>
  <x1:notificationtype/>
 </x0:prop>
</x0:propfind>
'

# strip newlines
XML=`echo "${XML}" | tr -d '\n'`

echo "Doing PROPFIND"
curl -v -i -u $USER_PASS -X PROPFIND $SERVER_URL -H "Depth: infinity"
