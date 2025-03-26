#! /bin/bash

. setup.bash

sixtesim \
Attitude=attitude_lissajous.fits \
Prefix=etaCar_att_ EvtFile=evt.fits \
XMLFile=${xml} \
Simput=merged_simput.fits \
Exposure=5000 \
clobber=yes

ftmerge \
etaCar_att_chip0_evt.fits,etaCar_att_chip1_evt.fits,etaCar_att_chip2_evt.fits,etaCar_att_chip3_evt.fits \
etaCar_att_combined_evt.fits clobber=yes

imgev \
EvtFile=etaCar_att_combined_evt.fits Image=etaCar_att_combined_img.fits \
CoordinateSystem=0 Projection=TAN \
NAXIS1=2954 NAXIS2=2954 CUNIT1=deg CUNIT2=deg \
CRVAL1=161.267156643662 CRVAL2=-59.684372315062 CRPIX1=1368.375 CRPIX2=1586.542 \
CDELT1=-1.527887e-04 CDELT2=1.527887e-04 history=true \
clobber=yes
