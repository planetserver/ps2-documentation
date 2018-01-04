# Rasdaman installation guide

# Author
Ramiro Marco Figuera

# Change Log

|Version|Name|Note|
|---|---|---|
|1|Ramiro Marco Figuera|First created in Jan. 2018|

# Introduction

Rasdaman is the array database manager used in PlanetServer. Currently PlanetServer uses rasdaman version 9.5. We strongly recommend using the **stable** version. A step by step guide to install Rasdaman from RPM is available in http://rasdaman.org/wiki/InstallFromRPM

# Rasdaman PlanetServer

We highly recommend to follow step by step the installation guide provided by the Rasdaman team, however we found out that, possibly, due to our configuration some extra or different steps have to be addressed.

1. on the installation section point 2 we proceed as follows:

   yum clean all

   yum update rasdaman

   yum search rasdaman

2. when updating we have noticed that most of the times the process fails. A workaround is to re-install rasdaman. Petascopedb will be safe therefore all the data will still be reachable. NOTE: this process might change in the future

3. As we use a special port for SECORE we have to change the port in the config file. In 9.5 the version file is found under **/opt/rasdaman/etc/petascope.properties**. The line that needs to be changes is:

   secore_urls=http://localhost:8080/def --> secore_urls=http://localhost:8081/def

# Notes

This guide works on rasdaman 9.5. We highly recommend to check any possible updates on the installation guide specially if a newer version is installed.
