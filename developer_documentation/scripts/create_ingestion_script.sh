#!/bin/bash

ls -1 *trr3_ingredient.json > list.txt
sed -e 's/^/wcst_import.sh /' list.txt > ingestion.sh
rm list.txt
sed -i '1 i\#!/bin/bash' ingestion.sh
chmod 777 ingestion.sh
