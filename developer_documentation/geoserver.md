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

TBD

# Geoserver as elevations provider

We followed the guide in http://docs.geoserver.org/stable/en/user/community/dds/index.html and http://pabercrombie.com/wordpress/2014/04/serving-bil-elevation-data-with-geoserver/ in order to set up geoserver to serve BIL16 elevations into WebWorldWind. You will find geoserver for PlanetServer under http://localhost:8083/geoserver/web/
