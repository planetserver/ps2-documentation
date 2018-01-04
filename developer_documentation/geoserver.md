# Geoserver architecture guide

# Author
Ramiro Marco Figuera

# Change Log

|Version|Name|Note|
|---|---|---|
|1|Ramiro Marco Figuera|First created in Jan. 2018|

# Introduction

Geoserver is used in PlanetServer as the elevations provider. This is used as WebWorldWind was created to be used with Earth Data and only contained elevations for the Earth globe.

# Data pre-processing

1. Reproject the tiff file with elevations to WGS84. This is a limitation by WMS standard.
2. Transform file to BIL16 format.

## Moon

`#/bin/bash!

gdal_translate Lunar_LRO_LOLA_Global_LDEM_118m_Mar2014.cub Lunar_LRO_LOLA_Global_LDEM_118m_Mar2014.cub.tif

gdalwarp -t_srs EPSG:4326 Lunar_LRO_LOLA_Global_LDEM_118m_Mar2014.cub.tif Lunar_LRO_LOLA_Global_LDEM_118m_Mar2014.cub.repro_wgs84.tif

mkdir tiles_cut
gdal_retile.py -v -r bilinear -ps 1024 1024 -co \
"TILED=YES" -targetDir tiles_cut \
Lunar_LRO_LOLA_Global_LDEM_118m_Mar2014.cub.repro_wgs84.tif
`


Moon data can be found in file:///storage/esp-data/data/data/MOON/lunar_dtm_lola/tiles_cut
Mars data can be found in file:///storage/esp-data/data/data/MARS/mosaic_viking/elevation_bil/tiles
TBD

# Geoserver as elevations provider

We followed the guide in http://docs.geoserver.org/stable/en/user/community/dds/index.html and http://pabercrombie.com/wordpress/2014/04/serving-bil-elevation-data-with-geoserver/ in order to set up geoserver to serve BIL16 elevations into WebWorldWind. You will find geoserver for PlanetServer under http://localhost:8083/geoserver/web/
