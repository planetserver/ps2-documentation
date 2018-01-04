# SECORE Developer guide

# Author
Ramiro Marco Figuera

# Change Log

|Version|Name|Note|
|---|---|---|
|1|Ramiro Marco Figuera|First created in Jan. 2018|

# Introduction

SECORE (Semantic Cordinate Reference System Resolver) is a server which resolves CRS URLs into full CRS definitions represented in GML 3.2.1. In PlanetServer we have created our own CRS as they are not included in the default rasdaman installation. For a general Developer documentation please see http://www.rasdaman.org/wiki/SecoreDevGuide

# PlanetServer SECORE

The list of CRS used in PlanetServer can be found in https://github.com/planetserver/planetary-crs

The ingestion of a CRS has the following steps:

1. go to: localhost:8081/def/crs/PS/0/browse.jsp
2. click on **add new definition**
3. paste the new CRS definition (you can use the one from the repository or add your own) and click **add**

![sec1](images/secore_1.png)

![sec2](images/secore_2.png)

# Notes

This guide works on rasdaman 9.5 and 9.4 versions. Notice that the ingestion of a not defined CRS might change in the future.
