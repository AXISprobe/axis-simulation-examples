#! /bin/bash

if [ ! -f CDFS_cat_lehmer.fits ]
then
	wget "https://www.sternwarte.uni-erlangen.de/~sixte/simput/CDFS_combined_simput.tgz"
	tar xfvz CDFS_combined_simput.tgz
fi

./1_sixtesim.bash
./2_ftmerge.bash
./3_imgev.bash
./4_attgen_dither.bash
./5_exposure_map.bash
./6_dither_sixtesim.bash
