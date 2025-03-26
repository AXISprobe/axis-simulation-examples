#! /bin/bash

. setup.bash

sixtesim \
Attitude=attitude_lissajous.fits \
Prefix=c_att_ EvtFile=evt.fits \
XMLFile=${xml} \
Simput=CDFS_cat_lehmer.fits,CDFS_cat_galaxies.fits \
Exposure=5000 \
clobber=yes


ftmerge \
c_att_chip0_evt.fits,c_att_chip1_evt.fits,c_att_chip2_evt.fits,c_att_chip3_evt.fits \
c_att_combined_evt.fits clobber=yes


imgev \
EvtFile=c_att_combined_evt.fits Image=c_att_combined_img.fits \
CoordinateSystem=0 Projection=TAN \
NAXIS1=2954 NAXIS2=2954 CUNIT1=deg CUNIT2=deg \
CRVAL1=53.13 CRVAL2=-27.8 CRPIX1=1368.375 CRPIX2=1586.542 \
CDELT1=-1.527887e-04 CDELT2=1.527887e-04 history=true \
clobber=yes
