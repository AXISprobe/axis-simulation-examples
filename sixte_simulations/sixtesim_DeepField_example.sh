#! /bin/bash
export xmldir=/path/to/axis_sixte_setup_3.1.0/

export xml0=${xmldir}axis_baseline_all_chips.xml

source axis_whole_init.sh

export inp_dir=/path/to/input_files/folder

sixtesim \
   RA=359.73 Dec=0.27 \
   Attitude=attitude_lissajous_80arcsec_100ks.fits \
   Prefix=axis_deep_100ks_w_Ricarte_Heavy-PL_zgt6_1_ \
   XMLFile=${xml0} \
   Simput=$inp_dir/CDFS_cat_bkg_gilli_15row.fits,$inp_dir/mock_AGN_ra00_dec00_w_Vito14_z_gt3_lt6_1.fits,$inp_dir/mock_SPRITZ_hot_gas_kphi_-4_a_1deg2_f_gt_-19_20230316.fits,$inp_dir/mock_SPRITZ_XRB_kphi_-4_a_1deg2_f_gt_-19_20230316.fits,$inp_dir/mock_clusters_ra00_dec00_1sqdeg_1.fits,$inp_dir/Ricarte_zgt6_f0510gt1E-19_Heavy-PL_1deg2.fits \
   Exposure=100000 \
   clobber=yes \
   chatter=1 
