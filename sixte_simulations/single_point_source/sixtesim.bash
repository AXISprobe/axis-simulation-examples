#!/bin/bash

. setup.bash

base=mcrab

$SIXTE/bin/sixtesim \
XMLFile=${xml} \
RA=0.000 Dec=0.000 \
Prefix=sim_ \
Simput=${base}.fits \
EvtFile=evt_${base}.fits \
Exposure=1000
