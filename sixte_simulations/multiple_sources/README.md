# Multiple point source example  

This example demonstrates how to combine multiple simput files for simulation. In this example, we take multiple single point sources and combine them into one simput file to run the simulation.


#### Step 1: Create SIMPUT and merge

The spectrum for these point sources are same as we used in single point source examples.

To see how we create SIMPUT file, please refer to [`Single point source example`](./single_point_source/README.md)

To generate a multiple simput files we use following script:
```bash 
#! /bin/bash

simpar="XSPECFile=mcrab.xcm Emin=0.5 Emax=10.0 clobber=yes"
simputfile RA=40.21 Dec=12.82 srcFlux=8.3e-12 Simput="src_00.fits" $simpar
simputfile RA=40.31 Dec=12.83 srcFlux=2.3e-11 Simput="src_01.fits" $simpar
simputfile RA=40.12 Dec=12.73 srcFlux=6.3e-12 Simput="src_02.fits" $simpar
simputfile RA=40.27 Dec=12.81 srcFlux=4.1e-12 Simput="src_03.fits" $simpar
simputfile RA=40.29 Dec=12.73 srcFlux=3.2e-11 Simput="src_04.fits" $simpar
simputfile RA=40.33 Dec=12.81 srcFlux=1.3e-11 Simput="src_05.fits" $simpar
```
After executing above script we can combine these simput files by using `simputmerge` tool and run the following script:
```bash 
#! /bin/bash

simputmerge \
Infiles=src_00.fits,src_01.fits,src_02.fits,\
src_03.fits,src_04.fits,src_05.fits \
Outfile=merged_simput.fits \
clobber=yes FetchExtensions=yes
```


#### Step 2: Run Simulation

```bash
#! /bin/bash

xmldir=$SIXTE/share/sixte/instruments/axis
xml=${xmldir}/axis_baseline_all_chips.xml

sixtesim \
XMLFile=${xml} \
RA=40.21 Dec=12.77 \
Prefix=sim_ \
Simput=merged_simput.fits \
EvtFile=evt.fits \
Exposure=1000 \
clobber=yes
```
Make above script executable and run it. It will create 4 event files in the output folder for all 4 chips. We need to combine these event file to analyze the simulation.

The combining these event files can be done by `ftmerge` tool as shown in the following terminal command:
```bash
ftmerge \
sim_chip0_evt.fits,sim_chip1_evt.fits,\
sim_chip2_evt.fits,sim_chip3_evt.fits \
sim_combined_evt.fits clobber=yes
```

#### Step 3: Analyze the simulation

We can now analyze the event files produced during the simulation.

We generate an image using `imgev` tool. The main input is to give the WCS coordinate system for the detector such as follow:

```bash
#! /bin/bash

imgev \
EvtFile=sim_combined_evt.fits \
Image=sim_combined_img.fits \
CoordinateSystem=0 Projection=TAN \
NAXIS1=2954 NAXIS2=2954 CUNIT1=deg CUNIT2=deg \
CRVAL1=40.21 CRVAL2=12.77 CRPIX1=1368.375 CRPIX2=1586.542 \
CDELT1=-1.527887e-04 CDELT2=1.527887e-04 history=true \
clobber=yes

```
The generated image can be seen in, e.g., `ds9`.

![muliple_point_source](./point_source_exp50ks.png)

---

Here's the master script to run above point source simulation: 
[`Master bash script`](./master_script.bash) 

[**BACK**](../README.md)
