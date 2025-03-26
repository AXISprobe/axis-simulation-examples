#! /bin/bash

simputmerge \
Infiles=src_00.fits,src_01.fits,src_02.fits,src_03.fits,src_04.fits,src_05.fits \
Outfile=merged_simput.fits \
clobber=yes FetchExtensions=yes
