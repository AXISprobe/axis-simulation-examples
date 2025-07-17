#! /bin/bash


xmldir=$SIXTE/share/sixte/instruments/axis
xml=${xmldir}/axis_baseline_all_chips.xml

simputfile=ngc4636_0.5to2keV_simput.fits

$SIXTE/bin/sixtesim \
XMLFile=${xml} \
RA=190.7078782 Dec=2.6877399 \
Prefix=sim_ Simput=$simputfile \
EvtFile=evt_ngc4636_0.5to2keV.fits \
Exposure=100000 \
clobber=yes

