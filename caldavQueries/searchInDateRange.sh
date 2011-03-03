#!/bin/bash

STARTDATE="20110305T000000Z"
ENDDATE="20110315T000000Z"
SERVER_URL="http://test.media.berkeley.edu:8080/ucaldav/principals/users/vbede/"
USER_PASS="vbede:bedework"

XML="
<?xml version='1.0'?>
<c:calendar-query xmlns:c='urn:ietf:params:xml:ns:caldav'>
    <d:prop xmlns:d='DAV:'>
        <d:getetag/>
        <c:calendar-data>
        </c:calendar-data>
    </d:prop>
    <c:filter>
        <c:comp-filter name='VCALENDAR'>
            <c:comp-filter name='VEVENT'>
                <c:time-range start='$STARTDATE' end='$ENDDATE'/>
            </c:comp-filter>
        </c:comp-filter>
    </c:filter>
</c:calendar-query>
"

# add \ before newlines
XML=`echo "${XML}" | tr '\n' '\\\n'`

curl -i -u $USER_PASS -X REPORT $SERVER_URL -d "${XML}"

echo
