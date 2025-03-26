#! /bin/bash

. setup.bash

exposure_map \
Vignetting=${xmldir}/sixte_calibration_files/axis_vignetting_20230821.fits \
Attitude=attitude_lissajous.fits \
Exposuremap=expo_map.fits \
XMLFile=${xml} \
fov_diameter=27.1 \
CoordinateSystem=0 projection_type=TAN \
NAXIS1=2954 NAXIS2=2954 CUNIT1=deg CUNIT2=deg \
CRVAL1=161.267156643662 CRVAL2=-59.684372315062 CRPIX1=1368.375 CRPIX2=1586.542 \
CDELT1=-1.527887e-04 CDELT2=1.527887e-04 \
TSTART=0 timespan=5000.000000 dt=100. \
chatter=3 clobber=true
