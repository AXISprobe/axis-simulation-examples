#! /bin/bash

simputmerge \
Infiles=etacar_low.fits,etacar_med.fits,etacar_high.fits \
Outfile=merged_simput.fits \
clobber=yes FetchExtensions=yes
