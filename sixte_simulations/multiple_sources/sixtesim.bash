#! /bin/bash

xmldir=$SIXTE/share/sixte/instruments/axis
xml=${xmldir}/axis_baseline_all_chips.xml

sixtesim \
XMLFile=${xml} \
RA=40.21 Dec=12.77 \
Prefix=sim_ \
Simput=merged_simput.fits \
EvtFile=evt.fits \
Exposure=1000 \
clobber=yes

