wget "http://oderest.rsl.wustl.edu/live2/?target=mars&query=product&results=m&output=XML&pt=TRDRDDR&iid=CRISM&ihid=MRO&proj=c0&westlon=0&eastlon=360&minlat=-90&maxlat=90&pdsid=$1" -O temp.xml > /dev/null 2>&1
ELon=($(grep -oP '(?<=Easternmost_longitude>)[^<]+' "temp.xml"))
WLon=($(grep -oP '(?<=Westernmost_longitude>)[^<]+' "temp.xml"))
echo $1 $ELon-$WLon
rm temp.xml
