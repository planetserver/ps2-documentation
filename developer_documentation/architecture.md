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
5. Start auxiliary tomcats: (after [ports_tomcat.md](ports_tomcat.md) )
```
cd /var/lib/tomcats/tomcat_wms/bin/
sudo ./startup.sh
cd /var/lib/tomcats/tomcat_secore/bin/
sudo ./startup.sh
cd /var/lib/tomcats/tomcat_geoserver/bin/
sudo ./startup.sh
```
6. Start primary (petascope) tomcat: `service tomcat start`
7. initialize the python server in **/var/www/html/python/** used to stretch the colour of the images. This is done by running `nohup python start.py &`

This should bring up all services and will start working after a few minutes. If services are down please check the following:

1. Check Infiniband is started
2. Check /var directory has enough space. Apache will not start if it cannot write out logs.
3. Check SElinux configuration


# Client side

The client side only contains WebWorldWind which needs to be deployed and configured as mentioned in the guideline:

1. [WebWorldWind](https://github.com/planetserver/ps2-documentation/blob/master/developer_documentation/web_world_wind_devel_guide.md)
2. Once both sides are deployed we need to initialize the python server in **/var/www/html/python/** used to stretch the colour of the images. This is done by running `nohup python start.py &`

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
/var/lib/tomcats/tomcat_geoserver/bin/catalina.sh start
service redis start
nohup python /var/www/html/python/start.py
service redis start
nohup python /var/www/html/python/start.py
```
# Troubleshooting
## Log files
The log files are located in
```
/var/lib/tomcats/tomcat_wms/logs/
/var/lib/tomcats/tomcat_secore/logs/
/var/lib/tomcats/tomcat_geoserver/logs/
/usr/share/tomcat/logs/
```
View them using command such as
```
ls -trahl /usr/share/tomcat/logs/
```
Read them using commands such as:
```
tail -1000 /var/lib/tomcats/tomcat_wms/logs/catalina.2018-04-04.log
tail -1000 /var/lib/tomcats/tomcat_wms/logs/catalina.out
tail -1000 /var/lib/tomcats/tomcat_wms/logs/localhost.2018-04-04.log
tail -1000 /var/lib/tomcats/tomcat_wms/logs/localhost_access_log.2018-04-04.txt
tail -1000 /var/lib/tomcats/tomcat_wms/logs/manager.2018-04-04.log
```

## Zombies
Sometimes Tomcat may not shut down correctly, to check if it did turn off all services (startup sequence in reverse):
```
service tomcat stop
cd /var/lib/tomcats/tomcat_geoserver/bin/
sudo ./shutdown.sh
cd /var/lib/tomcats/tomcat_secore/bin/
sudo ./shutdown.sh
cd /var/lib/tomcats/tomcat_wms/bin/
sudo ./shutdown.sh
service postgresql stop
systemctl stop rasdaman
```
Then run a diagnostic on the ports 808*:
```
sudo netstat -tulpn |grep 808
```
When all tomcats are running, ports 8080,8081,8082,8083 should be in a state LISTEN.
When all tomcats are stopped, ports 8080,8081,8082,8083 should not appear on the list.
If a process does appear after tomcat was stopped, its a zombie and needs to be terminated.
For example if netstat shows a zombie tomcat as 12345/java, you can kill it using
```
sudo kill -15 12345
```
Once the zombie process is terminated, you can restart databases and tomcats by running startup sequence:
```
systemctl start rasdaman
service postgresql start
cd /var/lib/tomcats/tomcat_wms/bin/
sudo ./startup.sh
cd /var/lib/tomcats/tomcat_secore/bin/
sudo ./startup.sh
cd /var/lib/tomcats/tomcat_geoserver/bin/
sudo ./startup.sh
service tomcat start
```

## Deadlocks
If a problem persists, it is possible that the database did not shutdown correctly and has unreleased locks.
To confirm check the logs of the petascope tomcat to see if there are complains about *liquibase*.
```
tail -1000 /usr/share/tomcat/logs/catalina.2018-04-04.log
```
If you do see a compaint about liquibase.exception.LockException, you must manually connect to the database:
```
sudo -u postgres /usr/bin/psql
```
Check if the lock exists when the database and tomcats are offline:
```
\l
\c petascopedb
\dt
select * from databasechangeloglock LIMIT 10;
```
You can remove this lock (make sure database and tomcats are all turned off first) by running:
```
DELETE FROM ONLY public.databasechangeloglock WHERE id = 1;
```
Manually releaseing the lock on the petascope may prevent Tomcat WMS from starting, 
because of a mismatch in a cached state of the webapp. 
This can be solved by re-deploying the rasdaman webapp. 
First create a backup of the webapp:
```
cd /var/lib/tomcats/tomcat_wms/webapps
sudo cp rasdaman.war rasdaman.war.backup
```
Next create an SSH tunnel to the port 8082 on rasdaman:
```
ssh -L 2345:localhost:8082 esp-rasdaman
```
Log into manager webapp (http://localhost:2345/manager/html)[http://localhost:2345/manager/html]
Using credentials awailable in
```
cat /var/lib/tomcats/tomcat_wms/conf/tomcat-users.xml
```
Undeploy rasdaman using manager app (make sure its backed up!). 
This will remove the rasdaman.war, and all the relevant directories.
Restore rasdaman from backup.
```
cd /var/lib/tomcats/tomcat_wms/webapps
sudo cp rasdaman.war.backup rasdaman.war
```
Shutdown all tomcats and databases and restart them.
In a few minutes PS should be working again.

## Ghosts
Having unused apps deployed on tomcat will create memory leaks. 
Make sure to undeploy all unused apps.
To undeploy, first create a backup of the * .war file by copying it to * .war.backup, 
then use manager app interface to first stop the app, then to undeploy it. 
This will remove the app and all its files. 
Finally shutdown and restart all tomcats and databases.
