#!/bin/bash

echo ">>>>>>>>>>>>>>>>>>>>>>>>$(hostname)>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"


echo " Author Name = $1."
echo "born date of this tool= $(date)."

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" 

check_cpu() {
	    USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
       	    USAGE=${USAGE%.*}   # remove decimal
    if [ "$USAGE" -gt 70 ]; then
          echo "⚠️  High CPU Usage: ${USAGE}%"
       else
	        echo "✅ CPU Usage: ${USAGE}%"
	    fi
	 }
check_cpu
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< DONE >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"


check_MEMORY() {
          MEMORY_INT=$(free | awk '/Mem/ {printf "%.0f", $3/$2 * 100}')

    echo "Memory is ${MEMORY_INT}%"

    if [ "$MEMORY_INT" -gt 70 ]; then
	        echo "Memory Usage Is High"
	        else
		        echo "Memory is Normal"
		    fi
	    }
check_MEMORY

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DONE >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

check_disk() {
	USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
	if [ "$USAGE" -gt 80 ]; then
		echo "high Disk Usage: ${USAGE}%"
	else 
		echo "Disk Usage: ${USAGE}%"
	fi


}
check_disk

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
