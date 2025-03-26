#! /bin/bash

RA=161.267156643662
Dec=-59.684372315062

simputfile Simput="etacar_low.fits" \
RA=${RA} \
Dec=${Dec} \
srcFlux=1e-11 \
Emin=3. \
Emax=8. \
Elow=2. \
Eup=10. \
XSPECFile=constflux \
ImageFile=etaCar_xray_low.fits \
clobber=yes
