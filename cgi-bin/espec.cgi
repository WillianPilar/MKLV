#!/bin/bash
read POST
IP=$(echo $POST | cut -d"=" -f2)
echo "content-type: text/html"
echo
echo "<h1>IP: $IP</h1>"
ping -W 1 -c 1 -i 1 $IP &> /dev/null
[[ $? == "0" ]] && echo "<h2> {$(date) | IP:$IP}--> UP</h2>" || echo "<h2> {$(date) | IP:$IP}--> DOWN</h2>"
