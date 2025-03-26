#! /bin/bash

. setup.bash

RA=161.267156643662
Dec=-59.684372315062

sixtesim \
XMLFile=${xml} \
RA=${RA} Dec=${Dec} \
Prefix=merged_ EvtFile=evt.fits \
Simput=merged_simput.fits \
Exposure=5000 \
clobber=yes
