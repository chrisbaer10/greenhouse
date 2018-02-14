#!/bin/bash

while :
do
temp=`curl -s 'http://192.168.1.93' | jq -r '.greenhouse_temp'`
echo $temp
if (( $(echo "$temp < 80" | bc -l) )); then
	echo "Turning Greenhouse Light on"
	gpio write 3 off
if (( $(echo "$temp > 100" | bc -l) )); then
	echo "Turning Greenhouse Light off"
	gpio write 3 on 
fi
fi
sleep 1
done
