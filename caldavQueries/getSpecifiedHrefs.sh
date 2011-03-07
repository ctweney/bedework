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
    <D:href>/ucaldav/user/vbede/calendar/717a6b8f-980d-4ca8-acb8-6079967830f3.ics</D:href>
    <D:href>/ucaldav/user/vbede/calendar/c8e78108-7c54-4bd6-b3cc-5e35fa20c92b.ics</D:href>
    <D:href>/ucaldav/user/vbede/calendar/test123456.ics</D:href>
</C:calendar-multiget>
'

# strip newlines
XML=`echo "${XML}" | tr -d '\n'`

curl -v -i -u $USER_PASS -X REPORT $SERVER_URL -d "$XML"

