#! /bin/bash

xmldir=$SIXTE/share/sixte/instruments/axis
xml=${xmldir}/axis_baseline_all_chips.xml

simpar="XSPECFile=spectrum.xcm Emin=0.5 Emax=10.0 clobber=yes"
simputfile RA=40.21 Dec=12.82 srcFlux=8.3e-12 Simput="src_00.fits" $simpar
simputfile RA=40.31 Dec=12.83 srcFlux=2.3e-11 Simput="src_01.fits" $simpar
simputfile RA=40.12 Dec=12.73 srcFlux=6.3e-12 Simput="src_02.fits" $simpar
simputfile RA=40.27 Dec=12.81 srcFlux=4.1e-12 Simput="src_03.fits" $simpar
simputfile RA=40.29 Dec=12.73 srcFlux=3.2e-11 Simput="src_04.fits" $simpar
simputfile RA=40.33 Dec=12.81 srcFlux=1.3e-11 Simput="src_05.fits" $simpar

simputmerge \
Infiles=src_00.fits,src_01.fits,src_02.fits,src_03.fits,src_04.fits,src_05.fits \
Outfile=merged_simput.fits \
clobber=yes FetchExtensions=yes

sixtesim \
XMLFile=${xml} \
RA=40.21 Dec=12.77 \
Prefix=output/sim_ \
Simput=merged_simput.fits \
EvtFile=evt.fits \
Exposure=1000 \
clobber=yes

ftmerge \
sim_chip0_evt.fits,sim_chip1_evt.fits,sim_chip2_evt.fits,sim_chip3_evt.fits \
sim_combined_evt.fits clobber=yes

imgev \
EvtFile=sim_combined_evt.fits \
Image=sim_combined_img.fits \
CoordinateSystem=0 Projection=TAN \
NAXIS1=2954 NAXIS2=2954 CUNIT1=deg CUNIT2=deg \
CRVAL1=40.21 CRVAL2=12.77 CRPIX1=1368.375 CRPIX2=1586.542 \
CDELT1=-1.527887e-04 CDELT2=1.527887e-04 history=true \
clobber=yes
