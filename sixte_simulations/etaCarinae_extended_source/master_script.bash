#! /bin/bash

if [ ! -f etaCar_xray_hi.fits ]
then
	wget "https://chandra.harvard.edu/photo/2014/etacar/fits/etaCar_xray_hi.fits"
	wget "https://chandra.harvard.edu/photo/2014/etacar/fits/etaCar_xray_med.fits"
	wget "https://chandra.harvard.edu/photo/2014/etacar/fits/etaCar_xray_low.fits"
fi

./1_simput_hi.bash
./1_simput_med.bash
./1_simput_low.bash
./2_simputmerge.bash
./3_sixtesim.bash
./4_ftmerge.bash
./5_imgev.bash
./6_attgen_dither.bash
./7_exposure_map.bash
./8_dither_sixtesim.bash
