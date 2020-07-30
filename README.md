# MadDM tutorial

This repository is based on the nice tutorial by Gopolang Mohlabeng
 presented in these [slides ](https://indico.cern.ch/event/656460/contributions/3040580/attachments/1683044/2704763/MadDM_ASP_2018_Tutorial.pdf). It has been compiled to run only with [docker](https://www.docker.com) and [docker-compose](https://docs.docker.com/compose/).

## Installation

### Install docker
In order to run this tutorial you will need to have `docker` and `docker-compose` installed on your machine. In case you don't have docker installed, you can easily do that by following the instructions on the docker [installation webpage](https://docs.docker.com/engine/install/ubuntu/).

### Pull the maddm docker image from docker-hub
Once [docker is installed and is running on your machine, pull the `maddm` repository from [docker-hub](https://hub.docker.com) by typing in your terminal:
```
docker pull valentem1992/maddm:latest
```
Once the download is finishes you are ready to go! 😄

## Run example
After having pulled the `valentem1992/maddm:latest` image from the docker-hub repository, you can run the maddm test run by typing in your terminal
```
docker-compose run maddm
```
If everything is fine, then you should see this MadDM output: 
```
***** Relic Density 
OMEGA IS  87304.3494429
INFO: Relic Density       = 8.73e+04       EXCLUDED  
INFO: x_f                 = 5.00e+00             
INFO: sigmav(xf)          = 1.34e-15             
INFO: xsi                 = 1.00e+00             
INFO: 
***** Direct detection [cm^2]:  
INFO: SigmaN_SI_p         All DM = 1.07e-46       ALLOWED       Xenon1ton ul     = 2.07e-45 
INFO: SigmaN_SI_n         All DM = 1.09e-46       ALLOWED       Xenon1ton ul     = 2.07e-45 
INFO: SigmaN_SD_p         All DM = 1.63e-61       ALLOWED       Pico60 ul        = 8.73e-41 
INFO: SigmaN_SD_n         All DM = 7.80e-61       ALLOWED       Lux2017 ul       = 2.58e-40 
INFO: Results written in: /home/hep/MG5_aMC_v2_6_3_2/output/DMsimp_s_spin0_MD/output/run_01/MadDM_results.txt 
quit
quit
```
This output shows you if this simulated model is consistent with the relic dark matter density estimation and also if the model is allowed by direct DM experiments constraints. The madgraph output will be stored in the `output` directory.

## Explore the code
You can see the commands passed to MadDM inside the [scripts/maddm-test.py](scripts/maddm-test.py) script. Enjoy MadDM! 😁