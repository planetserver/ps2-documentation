#!/bin/bash

while IFS='' read -r line || [[ -n "$line" ]]; do

NAME=${line:0:18}

sed 's/.^RDN_IMAGE    = .*/ ^RDN_IMAGE    = "'$NAME'_V01_RFL.IMG"/' "$NAME"_V03_L1B.LBL > temp.LBL

mv temp.LBL "$NAME"_V03_L1B.LBL

parallel chan1m32isis from={}_V03_L1B.LBL loc={.}_V03_LOC.IMG obs={.}_V03_OBS.IMG to={.}_V01_L2_HACK.cub ::: $NAME

parallel spiceinit from={.}_V01_L2_HACK.cub ::: $NAME

parallel cam2map from={.}_V01_L2_HACK.cub to={.}_V01_L2_HACK_simp0.cub map=moon_simp0.map ::: $NAME

parallel stretch from={.}_V01_L2_HACK_simp0.cub to={.}_V01_L2_HACK_simp0_nonull.cub NULL=65535 ::: $NAME

gdal_translate -a_nodata 65535 "$NAME"_V01_L2_HACK_simp0_nonull.cub "$NAME"_V01_L2_HACK_simp0.tif

done < "$1"
