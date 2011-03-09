#!/bin/bash

SERVER_URL="http://test.media.berkeley.edu:8080/ucaldav/user/vbede/calendar/"
USER_PASS="vbede:bedework"

XML='<?xml version="1.0" encoding="utf-8" ?>
<C:calendar-multiget xmlns:C="urn:ietf:params:xml:ns:caldav" xmlns:D="DAV:">
    <D:prop>
        <D:getetag/>
        <C:calendar-data/>
        <C:schedule-tag/>
    </D:prop>
    <D:href>/ucaldav/user/vbede/calendar/4e402d85-405c-4d02-b9e5-4bac1751b427.ics</D:href>
</C:calendar-multiget>
'

# strip newlines
XML=`echo "${XML}" | tr -d '\n'`

curl -v -i -u $USER_PASS -X REPORT $SERVER_URL -d "$XML"

