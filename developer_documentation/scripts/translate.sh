#!/bin/bash

mkdir tif
while IFS='' read -r line || [[ -n "$line" ]]; do

	gdal_translate -of GTiFF $line "tif/$line.tif"

done < "$1"
echo "done"
