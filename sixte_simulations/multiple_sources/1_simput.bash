#! /bin/bash

simpar="XSPECFile=spectrum.xcm Emin=0.5 Emax=10.0 clobber=yes"
simputfile RA=40.21 Dec=12.82 srcFlux=8.3e-12 Simput="src_00.fits" $simpar
simputfile RA=40.31 Dec=12.83 srcFlux=2.3e-11 Simput="src_01.fits" $simpar
simputfile RA=40.12 Dec=12.73 srcFlux=6.3e-12 Simput="src_02.fits" $simpar
simputfile RA=40.27 Dec=12.81 srcFlux=4.1e-12 Simput="src_03.fits" $simpar
simputfile RA=40.29 Dec=12.73 srcFlux=3.2e-11 Simput="src_04.fits" $simpar
simputfile RA=40.33 Dec=12.81 srcFlux=1.3e-11 Simput="src_05.fits" $simpar

