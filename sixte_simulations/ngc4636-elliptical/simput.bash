#!/bin/bash

$SIMPUT/bin/simputfile Simput=ngc4636_0.5to2keV_simput.fits \
      Src_Name=NGC4636 \
      RA=190.72066390978 \
      Dec=2.7236158153574 \
      srcFlux=5.4559e-12 \
      Elow=0.3 \
      Eup=10 \
      NBins=1000 \
      logEgrid=yes \
      Emin=0.5 \
      Emax=2 \
      XSPECFile=ngc4636_specmodel.xcm \
      ImageFile=$imgfile