#!/bin/bash

mkdir ingredients
echo "creating ingredients"
while IFS='' read -r line || [[ -n "$line" ]]; do
    TEMP=${line:0:18}
    C='"'
    C2='",'
    TEMP2='"coverage_id": '
    C3='..\/'
    DATA_PRODUCT=$TEMP2$C$TEMP$C2

    sed "24s/.*/    $DATA_PRODUCT/" m3_test_ingredient.json > ingredients/$TEMP'_ingredient'.json

    sed -i "27s/.*/     $C$C3$line$C/" ingredients/$TEMP'_ingredient'.json

done < "$1"
echo "done"
