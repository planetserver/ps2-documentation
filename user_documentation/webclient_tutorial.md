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

Junior Developer - Tsvetan Rankov  

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

<img src="https://raw.githubusercontent.com/megadiesel705/Planet-Server-Tutorial/master/planetserverv2/1_projection_mercator.png?token=AQvBJN5jbUqpd0iNA18XrpcmWtHXv-uoks5YtZ3MwA%3D%3D" width="500">

The second image shows you when I chose South Pole projection.  

<img src="https://raw.githubusercontent.com/megadiesel705/Planet-Server-Tutorial/master/planetserverv2/2_projection_south_pole.png?token=AQvBJFeb7oYcEKF8IVx8tG0s7vLnyofmks5YtZ5bwA%3D%3D" width="500">

Full list of projections is presented below:  

3D, Equirectangular, Mercator, North Polar, South Polar, North Gnomonic, South Gnomonic, North UPS, and South UPS.  

2 basemaps you can choose are Viking Mosaic and MOLA Colored.  

<img src="https://raw.githubusercontent.com/megadiesel705/Planet-Server-Tutorial/master/planetserverv2/3_basemap_mola_colored.png?token=AQvBJDdquxnOElhMx3b2ewNMFwd-GVAlks5YtZ7MwA%3D%3D" width="500">

<img src="https://raw.githubusercontent.com/megadiesel705/Planet-Server-Tutorial/master/planetserverv2/4_basemap_viking.png?token=AQvBJJFAWG344k1QQ1EbkwxLeOqR3AUAks5YtZ8EwA%3D%3D" width="500">

## Available Layers

At the moment two CRISM datasets are available on PlanetServer. CRISM TRDR images are fully working and CRISM MRDR images are being tested.



## Gazetteer and Landing sites

Gazetteer and landing sites on Mars are options available next to Basemap. Click on "show" and "hide" and you can see them or make them vanish on your map.

<img src="https://raw.githubusercontent.com/megadiesel705/Planet-Server-Tutorial/master/planetserverv2/5_gazetteer_landsites.png?token=AQvBJMsg7jt6zpSZTxspx_ypgyM8U6Rvks5YtZ8SwA%3D%3D" width="500">

As you scroll closer to the surface, you can see more points with name on it. Gazetteer can be chosen and selected out using range bar.    

<img src="https://raw.githubusercontent.com/megadiesel705/Planet-Server-Tutorial/master/planetserverv2/6_gazetteer_closer_range.png?token=AQvBJAQBsxmgNAFj1SXRf2uV4YdgvnXdks5YtZ9UwA%3D%3D" width="500">

## Goto button

Using this button along with its three options, you can go to specific places on surface of Mars. You can either decide where to go via "region", "footprint" or "lat, lon".  


Using "Region" selection:  

<img src="https://raw.githubusercontent.com/megadiesel705/Planet-Server-Tutorial/master/planetserverv2/7_goto_region.png?token=AQvBJL09A8Y_euTK34BLwfx477aO9Oyaks5YtZ9gwA%3D%3D" width="500">

Using "footprint" selection:  
<img src="https://raw.githubusercontent.com/megadiesel705/Planet-Server-Tutorial/master/planetserverv2/8_goto_footprint.png?token=AQvBJNYESNMptMlA05P5lkhFj8zXGw48ks5YtaAbwA%3D%3D" width="500">

## RGB Combinator

First you need to select a footprint. After you select one footprint, the converage will become a yellow circle.  

<img src="https://raw.githubusercontent.com/megadiesel705/Planet-Server-Tutorial/master/planetserverv2/9_selected_footprint.png?token=AQvBJBLfsSrbBq_85qcLjNyg-m3xXPFQks5YtaBLwA%3D%3D" width="500">

Then, you can choose combining method either using band or WCPS(CRISM product, see reference #1) queries.  

Using band:  
<img src="https://raw.githubusercontent.com/megadiesel705/Planet-Server-Tutorial/master/planetserverv2/10_band_combine.png?token=AQvBJHbeQoSIUDHVNKbyLNhnxV9RjIjWks5YtaB9wA%3D%3D" width="500">

Using WCPS Queries:  
<img src="https://raw.githubusercontent.com/megadiesel705/Planet-Server-Tutorial/master/planetserverv2/11_wcps_combine.png?token=AQvBJMd3uHFZb1U5rpe3_nK8KPfbBggFks5YtaC1wA%3D%3D" width="500">

## Spectra Analyzing & Spectra Ratio

On the right hand side of main page, you can find four buttons giving you general information of PlanetServer, spectra analyzing tool, spectra ratio tool and histogram tool.  

As you can see, you can choose several points and plot them on the same graph.  

You can choose range chart so that you can choose the scale of x-axis.  

<img src="https://raw.githubusercontent.com/megadiesel705/Planet-Server-Tutorial/master/planetserverv2/12_add_spectra.png?token=AQvBJJpiLTMCqqtrbakPVMoYsj46nEryks5YtcMKwA%3D%3D" width="500">

Also, you can take one of lab result by first choosing category and second choose specific material measurement from lab in order to compare materials on the points you previously chose.(lab product splib02a, see ref#2)  

<img src="https://raw.githubusercontent.com/megadiesel705/Planet-Server-Tutorial/master/planetserverv2/13_lab_comparison_spectra.png?token=AQvBJDnl0I04opwnPEQedIl_vLo3BDXPks5YtcQUwA%3D%3D" width="500">  

<img src="https://raw.githubusercontent.com/megadiesel705/Planet-Server-Tutorial/master/planetserverv2/14_lab_spectra_selections.png?token=AQvBJBiB8nFyKRgIgrPyXnlOSN8v8JOCks5YtcQgwA%3D%3D" width="500">

In third button, you can have the relative ratio of two points' spectras.  

As you can see, your chosen numerator shown as red dot on the map and your chosen denominator shown as blue dot.  

It's also possible to take lab data inside.  

You can download the plot as PNG, PDF, JPEG, and SVG. Also, you can save it as CSV, XLSX, and JSON.

<img src="https://raw.githubusercontent.com/megadiesel705/Planet-Server-Tutorial/master/planetserverv2/15_spectral_ratio.png?token=AQvBJFZlxETLPNgammm_e5Pzg0wMJORmks5YtcRRwA%3D%3D" width="500">  

Right click on the coverage, you can see several options as well. You can either select on several coverages and unlock one coverage from several you previously chose.  

Download the coverage in GeoTiff or PNG form is also possible.  

<img src="https://raw.githubusercontent.com/megadiesel705/Planet-Server-Tutorial/master/planetserverv2/16_right_click_on_coverage.png?token=AQvBJJXH-vafowwLNf3Cyv44-cYnaanZks5YtcVXwA%3D%3D" width="500">

<img src="https://raw.githubusercontent.com/megadiesel705/Planet-Server-Tutorial/master/planetserverv2/17_lock_unselect_on_several_coverage.png?token=AQvBJO2csHn17rD608DIpwDFiLViVCLlks5YtcW_wA%3D%3D" width="500">  

## For Moon's PlanetServer

On the top of PlanetServer page, you can switch between Mars and Moon by clicking two planets on the left hand side of the bar. Clicking Moon will bring you to Moon's PlanetServer interface.  

<img src="https://raw.githubusercontent.com/megadiesel705/Planet-Server-Tutorial/master/Client-Server-Tutorial/7_Top.png?token=AQvBJL9zIgSffe0fAImYZi1BSwfl_O2xks5YruC9wA%3D%3D" width="1000" alt="bar">

The functions of Moon PlanetServer are identical to those introduced in Mars PlanetServer.  

# References

#### 1
C. E. Viviano-Beck et al., “Revised CRISM spectral parameters and summary products based on the currently detected mineral diversity on Mars,” J. Geophys. Res. E Planets, vol. 119, no. 6, pp. 1403–1431, Jun. 2014.

#### 2
Clark, R. N., Swayze, G. A., Wise, R., Livo, K. E., Hoefen, T., Kokaly, R. F., & Sutley, S. J. (2007). USGS digital spectral library splib06a. US Geological Survey, Digital Data Series, 231.
