
# Single point source simulation 
In this example set we are simulating a non-variable point source with a spectrum that can be described by a simple absorbed power law.

---

### To simulate a Point source

#### Step 1: Create SIMPUT 

To create the simulation input SIMPUT file with the source description, we will use XSPEC to specify the model parameters, and the SIXTE tool simputfile to build the SIMPUT file.
This source has an absorbed power law spectrum with an unabsorbed flux of $2.16 \times 10^{-11} \text{ erg cm}^{-2} \text{ s}^{-1}$, a photon index of $Γ = 2.05$, and a foreground absorption with an equivalent hydrogen column of $2 \times 10^{21} \text{ cm}^{−2}$


```bash
		XSPEC version: 12.15.0
	Build Date/Time: Fri Mar 28 16:21:12 2025

XSPEC12>model phabs*pegpwrlw

Input parameter value, delta, min, bot, top, and max values for ...
              1      0.001(      0.01)          0          0     100000      1e+06
1:phabs:nH>0.2
              1       0.01(      0.01)         -3         -2          9         10
2:pegpwrlw:PhoIndex>2.05
              2      -0.01(      0.02)       -100       -100      1e+10      1e+10
3:pegpwrlw:eMin>2
             10      -0.01(       0.1)       -100       -100      1e+10      1e+10
4:pegpwrlw:eMax>10
              1       0.01(      0.01)          0          0      1e+20      1e+24
5:pegpwrlw:norm>21.6

========================================================================
Model phabs<1>*pegpwrlw<2> Source No.: 1   Active/Off
Model Model Component  Parameter  Unit     Value
 par  comp
   1    1   phabs      nH         10^22    0.200000     +/-  0.0          
   2    2   pegpwrlw   PhoIndex            2.05000      +/-  0.0          
   3    2   pegpwrlw   eMin       keV      2.00000      frozen
   4    2   pegpwrlw   eMax       keV      10.0000      frozen
   5    2   pegpwrlw   norm                21.6000      +/-  0.0          
________________________________________________________________________

XSPEC12>flux 2 10
 Model Flux 0.0032845 photons (2.1157e-11 ergs/cm^2/s) range (2.0000 - 10.000 keV)
XSPEC12>save model mcrab.xcm
XSPEC12>quit

```

Download the above generated single point source spectral model (xcm-file) for input: [`mcrab.xcm`](./mcrab.xcm)

Next, to generate the SIMPUT file with the `simputfile` tool, write a small shell script containing:

```bash
#!/bin/bash

base=mcrab

$SIMPUT/bin/simputfile Simput=${base}.fits \
Src_Name=first \
RA=0.0 \
Dec=0.0 \
srcFlux=2.137e-11 \
Elow=0.1 \
Eup=15 \
NBins=1000 \
logEgrid=yes \
Emin=2 \
Emax=10 \
XSPECFile=${base}.xcm
```
Save the script as `simput.bash`, make it executable `(chmod +x ./mcrab.fits)`, and execute it. Download link - [`simput.bash`](./simput.bash)

#### Step 2: Run the simulation

We can run observation simulations of this source  by creating a script with the following content:

```bash
#!/bin/bash

xmldir=$SIXTE/share/sixte/instruments/axis
xml=${xmldir}/axis_baseline_ccd1_ff.xml

base=mcrab

$SIXTE/bin/sixtesim \
XMLFile=${xml} \
RA=0.000 Dec=0.000 \
Prefix=output/sim_ \
Simput=${base}.fits \
EvtFile=evt_${base}.fits \
Exposure=1000
```
Make the script executable, create a directory named output for the simulation output, and execute it. The above script can be downloaded from here : [`sixtesin.bash`](./sixtesim.bash)

### Step 3: Analyzing the simulation
We can now analyze the event files produced during the simulation.

We generate an image using `imgev` tool. The main input is to give the WCS coordinate system for the detector such as follow:


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
You can then look at the image with standard astronomical image viewers such as ds9 or fv.

![point_source](./point_source_exp50ks.png)


---

Here's the master script to run above point source simulation: 
[`Master bash script`](./master_script.bash) 

[**BACK**](../README.md)