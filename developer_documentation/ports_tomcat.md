# Ports Tomcat Developer guide

# Author
Ramiro Marco Figuera

# Change Log

|Version|Name|Note|
|---|---|---|
|1|Ramiro Marco Figuera|First created in Jan. 2018|

# Introduction

After a couple of years of running PlanetServer we decided to use different ports in Tomcat for SECORE, Geoserver and rasdaman WMS. The ports we use are:

* SECORE --> port 8081
* WMS --> port 8082
* Geoserver --> port 8083


# TOMCAT ports for PlanetServer

We created 3 different directories for each of the services. In our configuration the directories are in **/storage/local/tomcats/**. For each tomcat we have to assign the right port in the server.xml file found in **tomcat_SERVICE/conf/service.xml** (e.g. tomcat_geoserver/conf/service.xml for the geoserver).

1. **<Connector port="8081" protocol="HTTP/1.1"** for SECORE
2. **<Connector port="8082" protocol="HTTP/1.1"** for WMS
3. **<Connector port="8083" protocol="HTTP/1.1"** for Geoserver

In order to start and stop each tomcat a script can be found under **/storage/local/tomcats/tomcat_SERVICE/bin/** with the name **startup.sh** and **shutdown.sh**

# Notes

This guide works on rasdaman 9.5. Notice that this configuration was specially designed for PlanetServer and might not be needed for other services. Separating the services in different ports will prevent propagating errors in case a service crashes.
