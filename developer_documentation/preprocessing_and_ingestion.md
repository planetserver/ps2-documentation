# Data pre-processing guide

# Author
Ramiro Marco Figuera

# Change Log

|Version|Name|Note|
|---|---|---|
|1|Ramiro Marco Figuera|First created in Jan. 2018|

# Introduction

PlanetServer provides access to two different datasets: CRISM Mars and M3 Moon. Each dataset is pre-processed using different software to prepare it for ingestion into rasdaman.

# Note if doing pre-processing at JUB

All the download and pre-processing of the data should be done in esp-test as this is the machine dedicated to do this process. esp-rasdaman should *only* be used as a service provider.

# CRISM MARS

To prepare the data for ingestion into Rasdaman run the following steps:

1. Locate the data in http://pds-geosciences.wustl.edu/missions/mro/crism.htm
2. Download trr3 files .img, .lbl and ddr files .img and .lbl
  * `wget -c --reject="index.html*" --no-parent -l1 -r -A.IMG,.LBL -nH -nd -np [URL containing files]`
  note,if this don't work because of robot restrictions, turn them off like this:
    * `wget -c -e robots=off --reject="index.html*" --no-parent -l1 -r -A.IMG,.LBL -nH -nd -np [URL containing files]`
  for example
    * `wget -c -e robots=off --reject="index.html*" --no-parent -l1 -r -A.img,.lbl -nH -nd -np http://pds-geosciences.wustl.edu/mro/mro-m-crism-3-rdr-targeted-v1/mrocr_2104/trdr/2010/2010_213/frt0001a11b/`
3. Place DDRs and TRR3 files in different directories.
  Note that the DDR parent directory name does not correspond to the TRR one, for instance for the above example, directory name is:
    * `http://pds-geosciences.wustl.edu/mro/mro-m-crism-6-ddr-v1/mrocr_1002/ddr/2010/2010_213/frt0001a11b/`
  So to download it use command like this:
    * `wget -c -e robots=off --reject="index.html*" --no-parent -l1 -r -A.img,.lbl -nH -nd -np http://pds-geosciences.wustl.edu/mro/mro-m-crism-6-ddr-v1/mrocr_1002/ddr/2010/2010_213/frt0001a11b/`
4. Then follow guide to process the data: [autocat](https://github.com/planetserver/autocat)
5. Place the output processed files from CAT into a directory then run the following scripts:
  1. `ls -1 *img > list.txt`
  2. run [translate.sh](scripts/translate.sh) list.txt
  3. run [get_footprints_crism.sh](scripts/get_footprints_crism.sh) list.txt
  3. `cd tif/`
  4. copy in the directory [test_ingestion_ingredient_l.json](scripts/test_ingestion_ingredient_l.json) and [test_ingestion_ingredient_s.json](scripts/test_ingestion_ingredient_s.json)
  5. run `ls -1 *l_trr3_CAT_scale_trial_p.img.tif > list_l.txt` and `ls -1 *s_trr3_CAT_scale_trial_p.img.tif > list_s.txt`
  6. `mkdir ingredients`
  7. run [ingredient_creation_l.sh](scripts/ingredient_creation_l.sh) list_l.txt
  8. run [ingredient_creation_s.sh](scripts/ingredient_creation_s.sh) list_s.txt
  9. `cd ingredients`
  10. run [create_ingestion_script.sh](scripts/create_ingestion_script.sh)
  11. run `./ingestion.sh`

# M3 MOON

1. Locate the data in https://pds-imaging.jpl.nasa.gov/volumes/m3.html
2. Download all L1B and L2 data: `wget -c --reject="index.html*" --no-parent -l1 -r -A.HDR,.TAB,.IMG,.LBL -nH -nd -np URL_containing_files` and place them in the same directory.
3. `ls -1 *_V03_L1B.LBL > list.txt`
4. run [paral_replace.sh](scripts/paral_replace.sh) list.txt
5. run [get_footprints_m3.sh](scripts/get_footprints_m3.sh) list.txt
5. copy [m3_test_ingredient.json](scripts/m3_test_ingredient.json)
6. run [ingredient_creation_m3.sh](scripts/ingredient_creation_m3.sh)
7. `cd ingredients`
8. run [create_ingestion_script.sh](scripts/create_ingestion_script.sh)
9. run `./ingestion.sh`

# Notes
