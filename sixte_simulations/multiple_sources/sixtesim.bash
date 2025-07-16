#! /bin/bash

. setup.bash

sixtesim \
XMLFile=${xml} \
RA=40.21 Dec=12.77 \
Prefix=sim_ \
Simput=merged_simput.fits \
EvtFile=evt.fits \
Exposure=1000 \
clobber=yes

