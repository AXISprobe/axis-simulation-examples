These are the examples simulations run by SIXTE for AXIS.

All information to download and install SIXTE can be found in the SIXTE website (<https://www.sternwarte.uni-erlangen.de/sixte/installation/>). 

In order to run the simulations you will also need the AXIS instrument (XML) files (link - <https://www.sternwarte.uni-erlangen.de/sixte/instruments/>). 

In case of question or problems with the SIXTE simulations, you can contact  the SIXTE Support <sixte-support@lists.fau.de>.

The folder `single_point_source`, `multiple_source`, `CDFS` and `etaCarinae_extended_source` contains scripts to run the simulation for a single point source, multiple point source, Chandra Deep Field South (CDFS) and etaCarinae extended source for AXIS respectively.

Each folder contains:

- a XCM file to generate simput files (except for CDFS, a combined simput file is provided),
 
- a setup.bash file (to provide the path for XML file of AXIS),

- simulation scripts (indexed by number according to the sequence in which they need to run), 

- and a master script (to run everything at once and obtain the final simulation event file and image).
