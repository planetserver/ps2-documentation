while read p; do
#    CName=`echo "$p" | cut -d'.' -f1`
    CName=$p
    PetascopeUrl="http://moon.planetserver.eu/rasdaman/ows?service=WCS&version=2.0.1&request=DescribeCoverage&CoverageId="
    wget "$PetascopeUrl$CName" -O temp.xml > /dev/null 2>&1
#    echo "wget $PetascopeUrl$CName -O temp.xml"
    imsize="$(grep -oP '(?<=high>)[^<]+' 'temp.xml')"
#    echo $imsize
    lowerCorner="$(grep -oP '(?<=lowerCorner>)[^<]+' 'temp.xml')"
    upperCorner="$(grep -oP '(?<=upperCorner>)[^<]+' 'temp.xml')"
    imWidth=`echo $imsize | cut -d' ' -f1`
    imHeight=`echo $imsize | cut -d' ' -f2`
    Emin=`echo $lowerCorner | cut -d' ' -f1`
    Nmin=`echo $lowerCorner | cut -d' ' -f2`
    Emax=`echo $upperCorner | cut -d' ' -f1`
    Nmax=`echo $upperCorner | cut -d' ' -f2`
#    imRes="$(grep -oP '(?<=offsetVector*>)[^<]+' 'temp.xml')"
#    imRes="$(grep -oP '(^>)[?</offsetVector]+' 'temp.xml')"
    imRes="$(grep -m1 'offsetVector' 'temp.xml' | cut -d'>' -f2 | cut -d' ' -f1)"
#    echo "$imRes"
    echo "UPDATE dataset SET  width=$imWidth,height=$imHeight,minimum_east=$Emin,minimum_north=$Nmin,maximum_east=$Emax,maximum_north=$Nmax,resolution=$imRes WHERE coverageid='$CName';"
#    rm temp.xml
done < $1

