# Planet Server Client Tutorial

# Author
Keyuan Yin

# Change Log

|Version|Name|Note|
|---|---|---|
|1|Keyuan Yin|First created in Feb. 2017|
|2|Ramiro Marco Figuera|Update January 2018|

# Introduction

PlanetServer provides access to calibrated hyper- and multispectral, topographic data on Solar System bodies. The main focus is on Mars and the Moon. Under page www.planetserver.eu, you can access to the client server.(cited from PlanetServer webpage)  

PlanetServer is a Service component of the EC-funded EarthServer-2 project (#654367) aimed at serving and analyzing planetary data online, mainly through OGC Web Coverage Processing Service (WCPS). The focus of PlanetServer is on complex data, particularly hyperspectral imaging and topographic ones. Data from Mars, the Moon and other Solar System Bodies will be available and queriable.(cited from PlanetServer webpage)  

Person in charge:  

Project Manager - Dr.Angelo Pio Rossi  

Lead Developer - Ramiro Marco Figuera  

Solution Developer - Bang Pham Huu  

Junior Developer - Anik Halder, Keyuan Yin and Tsvetan Rankov  

CREDITS:  

CRISM data provided by PDS  

MOLA Base Map provided by USGS

# How To Use It

If this is your first time going to our site, you will be asked if you are willing to take a brief tour of PlanetServer. That tour gives you basic operations on PlanetServer.

If you have already done the tour you will land directly on the Client

<img src="https://raw.githubusercontent.com/planetserver/ps2-documentation/master/user_documentation/images/%20intro_web.png?token=AMI5Y7VxH1XRaX_hBhc8w4yQFU_BgxTLks5aVfb7wA%3D%3D" width="90%"></img>

This tutorial will go deeper than that pilot.

## Basemaps & Projections

On the right hand side of the page, you can click to expand the page. In this expanded page, you will first see projections and basemaps you can choose.  

First image shows you when I chose Mercator projection.  

<img src="https://raw.githubusercontent.com/planetserver/ps2-documentation/master/user_documentation/images/mercator.png?token=AMI5Y98i0u8m_4yi7aA57XNVX6SYKvTGks5aVfhPwA%3D%3D" width="90%">

The second image shows you when I chose South Pole projection.  

<img src="https://raw.githubusercontent.com/planetserver/ps2-documentation/master/user_documentation/images/south_pole.png?token=AMI5YwaOowlpIVqmz73UC2UBarDThX6Oks5aVfhhwA%3D%3D" width="90%">

Full list of projections is presented below:  

3D, Equirectangular, Mercator, North Polar, South Polar, North Gnomonic, South Gnomonic, North UPS, and South UPS.  

2 basemaps you can choose are Viking Mosaic and MOLA Colored.  

<img src="https://raw.githubusercontent.com/planetserver/ps2-documentation/master/user_documentation/images/viking.png?token=AMI5Y75IyPimB3GFTuyBh6gE6XCrdpjEks5aVfh5wA%3D%3D" width="90%">

<img src="https://raw.githubusercontent.com/planetserver/ps2-documentation/master/user_documentation/images/mola.png?token=AMI5Y3CuZL2uc0VgkW_TWn_mJFpbZZd5ks5aVfiXwA%3D%3D" width="90%">

## Available Layers

At the moment two CRISM datasets are available on PlanetServer. CRISM TRDR images are fully working and the ones loaded by default. CRISM MRDR images are being tested and only a few images on the north pole are available.

<img src="https://raw.githubusercontent.com/planetserver/ps2-documentation/master/user_documentation/images/mrdr.png?token=AMI5Y3yMUrPIv0DliPLoUkECUHpovvNGks5aVfjZwA%3D%3D" width="90%">


## Gazetteer and Landing sites

Gazetteer and landing sites on Mars are options available next to Basemap. Click on "show" and "hide" and you can see them or make them vanish on your map.

<img src="https://raw.githubusercontent.com/planetserver/ps2-documentation/master/user_documentation/images/landing.png?token=AMI5Y00kzu-YKLN0zs6qVqxoO9HNhZOvks5aVfj1wA%3D%3D" width="90%">

As you scroll closer to the surface, you can see more points with name on it. Gazetteer can be chosen and selected out using range bar.    

<img src="https://raw.githubusercontent.com/planetserver/ps2-documentation/master/user_documentation/images/gaz.png?token=AMI5Y7KDL0M9IQkJ05KukWebHkw-WzjHks5aVfkKwA%3D%3D" width="90%">

## Goto button

Using this button along with its three options, you can go to specific places on surface of Mars. You can either decide where to go via "region", "footprint" or "lat, lon".  


Using "Region" selection:  

<img src="https://raw.githubusercontent.com/planetserver/ps2-documentation/master/user_documentation/images/goto_name.png?token=AMI5Y7V_YnaqPBWamXNLq26403SGX9Akks5aVfkrwA%3D%3D" width="90%">

Using "footprint" selection:  
<img src="https://raw.githubusercontent.com/planetserver/ps2-documentation/master/user_documentation/images/goto_image.png?token=AMI5Y3EXyam3dX4hYz69JsNHTkCJOQpEks5aVflDwA%3D%3D" width="90%">

Using Latitude and Longitude:

<img src="https://raw.githubusercontent.com/planetserver/ps2-documentation/master/user_documentation/images/goto_latlong.png?token=AMI5Y1yIVKabYKcdN1skav5DocTMY7WNks5aVfltwA%3D%3D" width="90%">


## RGB Combinator

First you need to select a footprint. After you select one footprint, the coverage will become a yellow circle.  

<img src="https://raw.githubusercontent.com/planetserver/ps2-documentation/master/user_documentation/images/selected.png?token=AMI5Y7F5tGzQl1AXIgvvyALHGF1BqRRVks5aVfmMwA%3D%3D" width="90%">

Then, you can choose combining method either using band or WCPS (CRISM product, see reference #1) queries.  

Using band:  
<img src="https://raw.githubusercontent.com/planetserver/ps2-documentation/master/user_documentation/images/band_select.png?token=AMI5Yx_K8dvlh5noN4gVbdt1nNnOeiqGks5aVfmswA%3D%3D" width="90%">

Using WCPS Queries:  
<img src="https://raw.githubusercontent.com/planetserver/ps2-documentation/master/user_documentation/images/wcps_query.png?token=AMI5Y5gbO5nzuPE-CMsmmUR3swmb-GDMks5aVfm-wA%3D%3D" width="90%">

## Spectra Analysis & Spectra Ratio

On the right hand side of main page, you can find four buttons giving you general information of PlanetServer, spectra analyzing tool, spectra ratio tool and histogram tool.  

Single spectra and multiple point spectra can be shown in the chart:

<img src="https://raw.githubusercontent.com/planetserver/ps2-documentation/master/user_documentation/images/single_spectra.png?token=AMI5Y_iXGeHdB_caXXGVKGRH4AYPBt2yks5aVfqkwA%3D%3D" width="90%">

<img src="https://raw.githubusercontent.com/planetserver/ps2-documentation/master/user_documentation/images/multiple.png?token=AMI5Y_iXGeHdB_caXXGVKGRH4AYPBt2yks5aVfqkwA%3D%3D" width="90%">

Also, you can take one of lab result by first choosing category and second choose specific material measurement from lab in order to compare materials on the points you previously chose.(lab product splib02a, see ref#2)  

<img src="https://raw.githubusercontent.com/planetserver/ps2-documentation/master/user_documentation/images/compare_spectra.png?token=AMI5Y-xx2jmeBI4TtRxPWJ0ajkPECiQGks5aVfrpwA%3D%3D" width="90%">  


In third button, you can have the relative ratio of two points'.  

As you can see, your chosen numerator shown as red dot on the map and your chosen denominator shown as blue dot.  

<img src="https://raw.githubusercontent.com/planetserver/ps2-documentation/master/user_documentation/images/ratio.png?token=AMI5Y3UHT9uE9QmQO5cEL3Q9znVtAIkoks5aVfshwA%3D%3D" width="90%">  


You can download the plot as PNG, PDF, JPEG, and SVG. Also, you can save it as CSV, XLSX, and JSON.

<img src="https://raw.githubusercontent.com/planetserver/ps2-documentation/master/user_documentation/images/cont_menu_II.png?token=AMI5Y3UHT9uE9QmQO5cEL3Q9znVtAIkoks5aVfshwA%3D%3D" width="90%">  

Right click on the coverage, you can see several options as well. You can either select on several coverages and unlock one coverage from several you previously chose.  

Download the coverage in GeoTiff or PNG form is also possible.  


## For Moon's PlanetServer

On the top of PlanetServer page, you can switch between Mars and Moon by clicking two planets on the left hand side of the bar. Clicking Moon will bring you to Moon's PlanetServer interface.  

<img src="https://raw.githubusercontent.com/planetserver/ps2-documentation/master/user_documentation/images/moon.png?token=AMI5Y4tgXkt57r4lYB9a9derBClxL5SRks5aVfwqwA%3D%3D" width="90%">

The functions of Moon PlanetServer are identical to those introduced in Mars PlanetServer.  

# References

#### 1
C. E. Viviano-Beck et al., “Revised CRISM spectral parameters and summary products based on the currently detected mineral diversity on Mars,” J. Geophys. Res. E Planets, vol. 119, no. 6, pp. 1403–1431, Jun. 2014.

#### 2
Clark, R. N., Swayze, G. A., Wise, R., Livo, K. E., Hoefen, T., Kokaly, R. F., & Sutley, S. J. (2007). USGS digital spectral library splib06a. US Geological Survey, Digital Data Series, 231.
