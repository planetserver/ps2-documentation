#!/bin/bash

mkdir footprints
echo "creating footprint ODE-REST queries..."

while IFS='' read -r line || [[ -n "$line" ]]; do
    TEMP=${line:0:26}
    TEMP2="wget -O temp.xml "
    TEMP22=".xml "
    TEMP33="_temp.xml "
    TEMPP= "_temp.xml"
    TEMP3="'http://oderest.rsl.wustl.edu/live2/?target=mars&query=product&results=m&output=XML&pt=TRDRDDR&iid=CRISM&ihid=MRO&proj=c0&westlon=0&eastlon=360&minlat=-90&maxlat=90&pdsid="
    TEMP4="'"
    echo $TEMP2$TEMP3$TEMP$TEMP4 > temp.sh
    chmod 777 temp.sh
    ./temp.sh
    tidy -xml -i temp.xml > footprints/$TEMP.xml


done < "$1"
rm temp.xml
rm temp.sh
