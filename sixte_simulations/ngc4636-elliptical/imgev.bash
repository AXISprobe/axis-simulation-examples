#! /bin/bash

$SIXTE/bin/imgev \
EvtFile=sim_all_evt_ngc4636_0.5to2keV.fits \
Image=img_ngc4636_0.5to2keV.fits \
CoordinateSystem=0 Projection=TAN \
NAXIS1=6000 NAXIS2=6000 CUNIT1=deg CUNIT2=deg \
CRVAL1=190.7078782 CRVAL2=2.6877399 \
CRPIX1=3000.0 CRPIX2=3000.0 \
CDELT1=-1.527777E-4 CDELT2=1.527777E-4 \
history=true clobber=yes
   