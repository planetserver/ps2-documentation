# Web World Wind Developer guide

# Author
Ramiro Marco Figuera

# Change Log

|Version|Name|Note|
|---|---|---|
|1|Ramiro Marco Figuera|First created in Jan. 2018|

# Introduction

Web World Wind is the 3D virtual globe and engine behind PlanetServer. It is developed by NASA in partnership with ESA. A full installation and developer guide can be found in https://worldwind.arc.nasa.gov/web/

We strongly recommend to clone the github repository https://github.com/NASAWorldWind/WebWorldWind/ to deploy the latest version.

# WebWorldWind for PlanetServer

As PlanetServer focuses on planetary data other than Earth based data, several files need to be changed depending on the planetary body we use. In our case we created special globes and instances for Mars and the Moon. Note that **we recommend to copy and replace the original files with the files in the repo**. However, in case you want to use PlanetServer for a different planetary body please adjust the following lines:

1. https://github.com/planetserver/ps2-www-client/blob/master/html/libs/web-world-wind/globe/EarthElevationModel.js
  * lines 32 to 59 adjust the max and min elevation for the planetary body
2. https://github.com/planetserver/ps2-www-client/blob/master/html/libs/web-world-wind/globe/Globe.js
  * line 78 to 80 adjust equatorial radius
  * line 87 to 91 adjust polar radius
  * line 98 adjust eccentricity. In PlanetServer we use spheres instead of ellipsoids therefore the eccentricity is 0.
3. https://github.com/planetserver/ps2-www-client/blob/master/html/libs/web-world-wind/layer/BMNGLayer.js
  * line 36 to 58 add your wms end point
4. https://github.com/planetserver/ps2-www-client/blob/master/html/libs/web-world-wind/shapes/Placemark.js
  * replace the whole file
5. https://github.com/planetserver/ps2-www-client/blob/master/html/libs/web-world-wind/util/WWUtil.js
  * replace the whole file

# Notes

The changes in this guideline might be different for newer version of WebWorldWind.
