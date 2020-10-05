#!/bin/bash
# foo.sh
id=$((10#`date +"%S"` % 4))
uid=$((id % 4 ))
date=`date +"%Y%m%d%H%M%S"| sed 's/^0*//'`
ax=$((10#`date +"%3N"` % 1000))
ay=$((10#`date +"%3N"` % 1000))

message={'"CollectionTime"':${date},'"UniqueId"':${id},'"X"':${ax},'"Y"':${ay}}
publish=`mosquitto_pub -h 10.0.3.147 -t rpm/sfloc -m ${message}`

message2={'"CollectionTime"':${date},'"UniqueId"':10,'"X"':300,'"Y"':${ay}}
publish2=`mosquitto_pub -h 10.0.3.147 -t rpm/sfloc -m ${message2}`

echo $publish
#echo "${date},${id},${ax},${ay}" >> loc_his.unv
sleep 2.5;
# ---
