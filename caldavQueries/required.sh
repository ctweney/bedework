#!/bin/bash

SERVER_URL="http://test.media.berkeley.edu:8080/ucaldav/user/vbede/calendar/"
USER_PASS="vbede:bedework"

XML='<?xml version="1.0" encoding="UTF-8"?>
<C:calendar-query xmlns:C="urn:ietf:params:xml:ns:caldav" xmlns:D="DAV:">
  <D:prop>
	<D:getetag/>
	<C:calendar-data/>
  </D:prop>
  <C:filter>
    <C:comp-filter name="VCALENDAR">
      <C:comp-filter name="VTODO">
        <C:time-range start="20110301T000000Z" end="20110331T235959Z"/>
        <C:prop-filter name="CATEGORIES">
            <C:text-match>MyBerkeley-Required</C:text-match>
        </C:prop-filter>
      </C:comp-filter>
    </C:comp-filter>
  </C:filter>
</C:calendar-query>
'

# strip newlines
XML=`echo "${XML}" | tr -d '\n'`

echo "Posting XML to server: "
echo $XML
echo "Response:"
echo
curl -i -u $USER_PASS -X REPORT $SERVER_URL -d "$XML" -H "Depth: infinity"


