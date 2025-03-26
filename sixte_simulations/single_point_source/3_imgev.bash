#!/bin/bash

$SIXTE/bin/imgev \
EvtFile=sim_evt_mcrab.fits \
Image=img_mcrab.fits \
CoordinateSystem=0 Projection=TAN \
NAXIS1=1440 NAXIS2=1440 CUNIT1=deg CUNIT2=deg \
CRVAL1=0.0 CRVAL2=0.0 CRPIX1=720.5 CRPIX2=720.5 \
CDELT1=-1.527887e-04 CDELT2=1.527887e-04 history=true \
clobber=yes
