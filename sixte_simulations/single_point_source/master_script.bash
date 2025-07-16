#! /bin/bash

xmldir=$SIXTE/share/sixte/instruments/axis
xml=${xmldir}/axis_baseline_ccd1_ff.xml

base=mcrab

simputfile \
Simput=${base}.fits \
Src_Name=first \
RA=0.0 Dec=0.0 \
srcFlux=2.137e-11 \
Elow=0.1 Eup=15 \
NBins=1000 \
logEgrid=yes \
Emin=2 Emax=10 \
XSPECFile=${base}.xcm

sixtesim \
XMLFile=${xml} \
RA=0.000 Dec=0.000 \
Prefix=sim_ \
Simput=${base}.fits \
EvtFile=evt_${base}.fits \
Exposure=1000

imgev \
EvtFile=sim_evt_mcrab.fits \
Image=img_${base}.fits \
CoordinateSystem=0 Projection=TAN \
NAXIS1=1440 NAXIS2=1440 CUNIT1=deg CUNIT2=deg \
CRVAL1=0.0 CRVAL2=0.0 CRPIX1=720.5 CRPIX2=720.5 \
CDELT1=-1.527887e-04 CDELT2=1.527887e-04 history=true \
clobber=yes


