#!/bin/bash

lineCPU=$(top -bn 2|grep Cpu |tail -n 1|tr -d [:alpha:])
IDLE=$(echo $lineCPU |cut -d " " -f8 |tr "," "." )
IOWAIT=$(echo $lineCPU |cut -d " " -f10 |tr "," "." )

#Insertamos en el measurement 'cpu' los dos puntos.
curl "http://localhost:8086/write?db=monitoring" --data-binary "cpu,iowait=$IOWAIT idle=$IDLE"

