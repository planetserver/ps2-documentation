# PlanetServer architecture guide

# Author
Ramiro Marco Figuera

# Change Log

|Version|Name|Note|
|---|---|---|
|1|Ramiro Marco Figuera|First created in Jan. 2018|

# Introduction

PlanetServer's main architecture is divided in two sides: the server and the client side. On the server side we use Rasdaman as our array database manager and WMS server. On the client side we use WebWorldWind in order to access and deploy the data. All data is accessed using the OGC standard Web Coverage Processing Service (WCPS) allowing the user to fully analyze datacubes.

# Server side

The server side contains different services. All services need to be installed and configured as mentioned in the following guides:

1. [Rasdaman](https://github.com/planetserver/ps2-documentation/blob/master/developer_documentation/rasdaman_install.md)
2. [Ports TOMCAT](https://github.com/planetserver/ps2-documentation/blob/master/developer_documentation/ports_tomcat.md)
3. [Geoserver](https://github.com/planetserver/ps2-documentation/blob/master/developer_documentation/geoserver.md)
4. [SECORE](https://github.com/planetserver/ps2-documentation/blob/master/developer_documentation/secore.md)

In order to restart all services if machines are rebooted or there is a power outage:

1. Manually install Infiniband drivers (ask Florian)
2. Check if Apache is working `service httpd status` if down then run `service httpd start`
3. `service rasdaman start`
4. `service postgresql start`
5. follow [ports_tomcat.md](ports_tomcat.md)
6. `service tomcat start`
7. initialize the python server in **/html/python/** used to stretch the colour of the images. This is done by running `nohup python start.py &`

This should bring up all services and will start working after a few minutes. If services are down please check the following:

1. Check Infiniband is started
2. Check /var directory has enough space. Apache will not start if it cannot write out logs.
3. Check SElinux configuration


# Client side

The client side only contains WebWorldWind which needs to be deployed and configured as mentioned in the guideline:

1. [WebWorldWind](https://github.com/planetserver/ps2-documentation/blob/master/developer_documentation/web_world_wind_devel_guide.md)
2. Once both sides are deployed we need to initialize the python server in **/html/python/** used to stretch the colour of the images. This is done by running `nohup python start.py &`

# NOTES

If service throws a 503 error, it is possibly because of a SElinux configuration error. Run the following script:

     disable SELinux for http to be able to run
     petascope proxy via httpd:
     config in this file /etc/httpd/conf/httpd.conf
     # Mars server
     #start redis caching service for python stretching server
     service redis start
     #start python stretching service
     nohup python start.py
     # Moon server
     #start postgresql
     service postgresql start
     #start tomcat for rasdaman
     service tomcat start
     
 Bang's method of fixing SElinux:
```
setenforce 0
/var/lib/tomcats/tomcat_secore/bin/catalina.sh start
/var/lib/tomcats/tomcat_wms/bin/catalina.sh start
/var/lib/tomcats/tomcat_geoserver/bin/catalina.sh startservice redis start
nohup python /var/www/html/python/start.py
service redis start
nohup python /var/www/html/python/start.py
```
