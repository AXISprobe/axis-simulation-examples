#! /bin/bash

ftmerge \
cdfs_chip0_evt.fits,cdfs_chip1_evt.fits,cdfs_chip2_evt.fits,cdfs_chip3_evt.fits \
cdfs_combined_evt.fits clobber=yes
