#! /bin/bash

. setup.bash

sixtesim \
RA=53.13 Dec=-27.8 \
Prefix=cdfs_ EvtFile=evt.fits \
XMLFile=${xml} \
Simput=CDFS_cat_lehmer.fits,CDFS_cat_galaxies.fits \
Exposure=5000 \
clobber=yes
