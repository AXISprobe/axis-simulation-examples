#!/bin/sh
# Example created by A. Ptak based on the AXIS simulation web page at https://axis.umd.edu/researchers/simulation-resources
# The example currently on the website is a bit out of date based on current SIXTE syntax

imgfile=ngc4636_img0.5to2keV.fits_.gz
if test ! -f $imgfile; then
  echo "$imgfile doesn't exist, downloading"
  curl -O https://axis.umd.edu/sites/default/files/2025-02/$imgfile
fi

if test ! -f $imgfile; then
    echo "Failed to download ngc4636_img0.5to2keV.fits_.gz"
    exit
fi

simputfile=ngc4636_0.5to2keV_simput.fits
if test -f $simputfile; then
    echo "$simputfile already exists"
else
    echo "Creating $simputfile..."
    echo "$SIXTE/bin/simputfile Simput=$simputfile \
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
      ImageFile=$imgfile"
    $SIXTE/bin/simputfile Simput=$simputfile \
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
fi

if test ! -f $simputfile; then
    echo "simput failed to create $simputfile"
    exit
fi

evtfile=sim_all_evt_ngc4636_0.5to2keV.fits
chip0file=sim_chip0_evt_ngc4636_0.5to2keV.fits

if test ! -f $evtfile; then
    echo "$evtfile doesn't exits, checking for individual chip events files"
    if test ! -f chip0file; then
	echo "$evtfile doesn't exist, running sixte..."
	$SIXTE/bin/sixtesim XMLFile=$SIXTE/share/sixte/instruments/axis/axis_baseline_all_chips.xml RA=190.7078782 Dec=2.6877399 Prefix=sim_ Simput=$simputfile  EvtFile=evt_ngc4636_0.5to2keV.fits Exposure=100000
    fi
    if  test ! -f chip0file; then
       echo "Error running sixtesim"
       exit
    fi
    echo "Running ftmerge to merge chip event files"
    ftmerge sim_chip0_evt_ngc4636_0.5to2keV.fits,sim_chip1_evt_ngc4636_0.5to2keV.fits,sim_chip2_evt_ngc4636_0.5to2keV.fits,sim_chip3_evt_ngc4636_0.5to2keV.fits sim_all_evt_ngc4636_0.5to2keV.fits
    if test ! -f $evtfile; then
	echo "Error running ftmerge"
	exit
    fi
fi

imgfile=img_ngc4636_0.5to2keV.fits
if test ! -f $imgfile;
   echo "Generating image file $imgfile"
   $SIXTE/bin/imgev EvtFile=sim_all_evt_ngc4636_0.5to2keV.fits Image=img_ngc4636_0.5to2keV.fits CoordinateSystem=0 Projection=TAN NAXIS1=6000 NAXIS2=6000 CUNIT1=deg CUNIT2=deg CRVAL1=190.7078782 CRVAL2=2.6877399 CRPIX1=3000.0 CRPIX2=3000.0 CDELT1=-1.527777E-4 CDELT2=1.527777E-4 history=true clobber=yes
   
fi
   
   
if test ! -f $imgfile; then
    echo "Error generating $imgfile"
    exit
fi

 
