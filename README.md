# MadDM tutorial

This repository is based on the nice tutorial by Gopolang Mohlabeng
 presented in these [slides ](https://indico.cern.ch/event/656460/contributions/3040580/attachments/1683044/2704763/MadDM_ASP_2018_Tutorial.pdf). It has been compiled to run only with [docker](https://www.docker.com) and [docker-compose](https://docs.docker.com/compose/). Enjoy MadDM! 😁

## Installation

### Install docker
In order to run this tutorial you will need to have `docker` and `docker-compose` installed on your machine. In case you don't have docker installed, you can easily do that by following the instructions on the docker [installation webpage](https://docs.docker.com/engine/install/ubuntu/).

### Pull the MadDM docker image from docker-hub
Once [docker is installed and is running on your machine, pull the `maddm` repository from [docker-hub](https://hub.docker.com) by typing in your terminal:
```
docker pull valentem1992/maddm:latest
```
Once the download finishes you are ready to go! 😄

## Run test example
After having pulled the `valentem1992/maddm:latest` image from the docker-hub repository, you can run the MadDM test run by typing in your terminal
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
This output shows you if the simulated model is consistent with the relic dark matter density estimation and also if the model is allowed by direct DM experiments constraints. The Madgraph output will be stored in the `output` directory.

### Explore the code
You can see the commands passed to MadDM inside the [scripts/maddm-test.py](scripts/maddm-test.py) script.


## Run complete example
If you have pulled the `valentem1992/maddm:latest` image from the docker-hub 
you can continue with the next steps. Otherwise, follow the instructions in the
[Installation](#installation) section before continuing.

The test example shown above is very simple but it does not allow you to modify the parameters of your Dark Matter model.
In order to do this, you will have to proceed in two steps:

1. Run the creation of the MadDM output where the `param_card.dat` configuration file will be created. You can directly modify masses and couplings of the DM sector in this file before launching the MadDM calculation.
2. Run the MadDM calculation using the values modified inside `param_card.dat`.


### Generate parameters files
You can run the maddm parameter card generation by typing in your terminal
```
docker-compose run maddm ./bin/maddm.py -f scripts/maddm-gencards.py
```
This will create an `output/` directory where the model folder is stored. The `param_card.dat` file is stored as `output/DMsimp_s_spin0_MD/Cards/param_card.dat`.
Have a look at the file and see which parameters you can modify! 😁

### Run MadDM calculation on modified parameters
Once your parameters have been modified, you can run the MadDM calculation by executing
```
docker-compose run maddm ./bin/maddm.py -f scripts/maddm-runcards.py
```
This command will store the output of your modified model to the `output/DMsimp_s_spin0_MD/output` folder. You can look at the output from MadDM in you terminal as well as in the file `output/DMsimp_s_spin0_MD/output/run_01/MadDM_results.txt`.

After having set the mass of `Xd` to $100\;\text{GeV}$
```
5000521 1.000000e+02 # MXd 
```
the output from MadDM changes to:
```
INFO: Start computing relic,direct 
maddm_card missed argument print_sigmas. Takes default: False
INFO: compilation done 
INFO: MadDM Results 
INFO: 
***** Relic Density 
OMEGA IS  2007.1271299
INFO: Relic Density       = 2.01e+03       EXCLUDED  
INFO: x_f                 = 1.10e+01             
INFO: sigmav(xf)          = 7.49e-14             
INFO: xsi                 = 1.00e+00             
INFO: 
***** Direct detection [cm^2]:  
INFO: SigmaN_SI_p         All DM = 1.26e-46       ALLOWED       Xenon1ton ul     = 1.37e-46 
INFO: SigmaN_SI_n         All DM = 1.28e-46       ALLOWED       Xenon1ton ul     = 1.37e-46 
INFO: SigmaN_SD_p         All DM = 2.01e-62       ALLOWED       Pico60 ul        = 5.43e-41 
INFO: SigmaN_SD_n         All DM = 2.00e-62       ALLOWED       Lux2017 ul       = 2.77e-41 
INFO: Results written in: /home/hep/MG5_aMC_v2_6_3_2/output/DMsimp_s_spin0_MD/output/run_01/MadDM_results.txt
```
It seems that the Dark Matter model set with these parameters is not excluded by direct DM experiments but it can still not satisfy the observed relic DM density! 😔 Try with more parameters and enjoy MadDM!
