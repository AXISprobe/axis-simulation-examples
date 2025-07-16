## NGC 4636 Elliptical Galaxy Example ##
This example follows the example of the elliptical galaxy NGC 4636 on https://axis.umd.edu/researchers/simulation-resources

The file n4636_axis_sixte.sh will run the key simulation steps detailed on the AXIS website including downloading the relevant input data.

---
---
---



# NGC 4636 Elliptical Galaxy Example

This example follows the example of the elliptical galaxy NGC 4636 on https://axis.umd.edu/researchers/simulation-resources

The file n4636_axis_sixte.sh will run the key simulation steps detailed on the AXIS website including downloading the relevant input data.

---

### Preparation of the input of the simulation

#### Step 1: XSPEC

The spectral model parameter for NGC 4636 Eliptical galaxy is provide for this simulation are as follows:

```bash

		XSPEC version: 12.15.0
	Build Date/Time: Wed Jun 18 09:54:48 2025

XSPEC12>@ngc4636_specmodel.xcm 

!XSPEC12>method leven 10 0.01

!XSPEC12>abund angr
 Solar Abundance Vector set to angr:  Anders E. & Grevesse N. Geochimica et Cosmochimica Acta 53, 197 (1989)

!XSPEC12>xsect vern
 Cross Section Table set to vern:  Verner, Ferland, Korista, and Yakovlev 1996

!XSPEC12>cosmo 70 0 0.73

!XSPEC12>xset delta 0.01
Parameter delta values for fits will now be 0.01 * parValue

!XSPEC12>systematic 0

 The default systematic error for models is set to 0


!XSPEC12>model  phabs(apec + powerlaw)  ;            0.019     -0.001          0          0     100000      1e+06  ;         0.749263       0.01      0.008      0.008         64         64  ;         0.333143      0.001          0          0          5          5  ;           0.0031      -0.01     -0.999     -0.999         10         10  ;       0.00488632       0.01          0          0      1e+20      1e+24  ;          0.42368       0.01         -3         -2          9         10  ;      1.02222e-05       0.01          0          0      1e+20      1e+24
Reading APEC data from 3.1.2


========================================================================
Model phabs<1>(apec<2> + powerlaw<3>) Source No.: 1   Active/Off
Model Model Component  Parameter  Unit     Value
 par  comp
   1    1   phabs      nH         10^22    1.90000E-02  frozen
   2    2   apec       kT         keV      0.749263     +/-  0.0          
   3    2   apec       Abundanc            0.333143     +/-  0.0          
   4    2   apec       Redshift            3.10000E-03  frozen
   5    2   apec       norm                4.88632E-03  +/-  0.0          
   6    3   powerlaw   PhoIndex            0.423680     +/-  0.0          
   7    3   powerlaw   norm                1.02222E-05  +/-  0.0          
________________________________________________________________________


!XSPEC12>bayes off
```
Download the above generated NGC 4636 spectral model (xcm-file) for input: [`ngc4636_specmodel.xcm`](./ngc4636_specmodel.xcm)

#### Step 2: SIMPUT
Using SIMPUT to generate the simputfile to simulate the point source in SIXTE based on above spectral parameters. Following is the bash script. 

```bash
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


//TODO: Do we need ImageFile here?
//TODO: Andy used SIXTE/bin/simputfile in his script. 
```
```python 
{include=./simput.bash}
```
cat
Download the bash script to generate above $\text{simputfile}$ of NGC 4636: [`simput.bash`](./simput.bash)

### Running the simulation

Using sixtesim to simulate the point source on the AXIS mirror for 100000 ks

---

```bash
#!/bin/bash

xmldir=$SIXTE/share/sixte/instruments/axis
xml=${xmldir}/axis_baseline_all.xml

$SIXTE/bin/sixtesim \
XMLFile=${xml} \
RA=190.7078782 Dec=2.6877399 \
Prefix=sim_ \
Simput=ngc4636_0.5to2keV_simput.fits  \
EvtFile=evt_ngc4636_0.5to2keV.fits \
Exposure=100000
```
Download the bash script to generate event file of point source simulated based on above simput file : [`sixtesin.bash`](./sixtesim.bash)

### Analyzing the simulation
Using $imgev$ tool of SIXTE to analyze the simulated event file  

#### Step 1  Merge the event files

Running ftmerge tool of SIXTE to merge all 4 event files generated in above step

```bash
ftmerge \
sim_chip0_evt_ngc4636_0.5to2keV.fits,sim_chip1_evt_ngc4636_0.5to2keV.fits,\
sim_chip2_evt_ngc4636_0.5to2keV.fits,sim_chip3_evt_ngc4636_0.5to2keV.fits \
sim_all_evt_ngc4636_0.5to2keV.fits clobber=yes
   
```

```bash
#!/bin/bash

$SIXTE/bin/imgev \
EvtFile=sim_evt_mcrab.fits \
Image=img_mcrab.fits \
CoordinateSystem=0 Projection=TAN \
NAXIS1=1440 NAXIS2=1440 CUNIT1=deg CUNIT2=deg \
CRVAL1=0.0 CRVAL2=0.0 CRPIX1=720.5 CRPIX2=720.5 \
CDELT1=-1.527887e-04 CDELT2=1.527887e-04 history=true \
clobber=yes
```
Download the bash script for above analysis on AXIS mirror: [`imgev.bash`](./imgev.bash)

![elliptical galaxy](./ngc4636_img.png)


### Master script
To run above scripts in one go please downlaod this bash script: 
[`Master bash script`](./n4636_axis_sixte.sh) 

[**BACK**](../README.md)
