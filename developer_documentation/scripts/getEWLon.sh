while read p; do
    CName=`echo "$p" | cut -d'.' -f1`
    OdeUrl="http://oderest.rsl.wustl.edu/live2/?target=mars&query=product&results=m&output=XML&pt=TRDRDDR&iid=CRISM&ihid=MRO&proj=c0&westlon=0&eastlon=360&minlat=-90&maxlat=90&pdsid="
    wget "$OdeUrl$CName" -O temp.xml > /dev/null 2>&1
    ELon=($(grep -oP '(?<=Easternmost_longitude>)[^<]+' "temp.xml"))
    WLon=($(grep -oP '(?<=Westernmost_longitude>)[^<]+' "temp.xml"))
    if test `echo "$WLon<180 && $ELon>180 && ($WLon-$ELon)<180" | bc -l` -gt 0; then
        echo "rm $p"
    fi
    rm temp.xml
done < $1
