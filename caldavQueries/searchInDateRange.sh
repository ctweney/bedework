#!/bin/bash

STARTDATE="20110305T000000Z"
ENDDATE="20110315T000000Z"
SERVER_URL="http://test.media.berkeley.edu:8080/ucaldav/user/vbede/calendar/"
USER_PASS="vbede:bedework"

XML='<?xml version="1.0" encoding="utf-8" ?>
<C:calendar-query xmlns:D="DAV:"
              xmlns:C="urn:ietf:params:xml:ns:caldav">
  <D:prop>
    <D:getetag/>
    <C:calendar-data>
      <C:comp name="VCALENDAR">
        <C:prop name="VERSION"/>
        <C:comp name="VEVENT">
          <C:prop name="SUMMARY"/>
          <C:prop name="UID"/>
          <C:prop name="DTSTART"/>
          <C:prop name="DTEND"/>
          <C:prop name="DURATION"/>
          <C:prop name="RRULE"/>
          <C:prop name="RDATE"/>
          <C:prop name="EXRULE"/>
          <C:prop name="EXDATE"/>
          <C:prop name="RECURRENCE-ID"/>
        </C:comp>
        <C:comp name="VTIMEZONE"/>
      </C:comp>
    </C:calendar-data>
  </D:prop>
  <C:filter>
    <C:comp-filter name="VCALENDAR">
      <C:comp-filter name="VEVENT">
        <C:time-range start="$STARTDATE"
                      end="$ENDDATE"/>
      </C:comp-filter>
    </C:comp-filter>
  </C:filter>
</C:calendar-query>
'

# strip newlines
XML=`echo "${XML}" | tr -d '\n'`

curl -v -i -u $USER_PASS -X REPORT $SERVER_URL -d "$XML"


