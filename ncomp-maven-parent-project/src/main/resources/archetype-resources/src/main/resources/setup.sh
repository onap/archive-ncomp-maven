#!/bin/bash
set -v

#STEP 1 build code
( cd git/GNAMEEE/PPPP ; mvn clean install ) || exit

#STEP 2 install and start service controller
bin/ncomp-tool install-sirius-controller GNAMEEE PPPP-server 7112 || exit

#STEP 3 start controller GUI
bin/ncomp-tool install-sirius-controller-gui PPPP-server "XXXX"


#STEP 4 start console and create anormaly
echo make console
echo :load scripts/console.groovy




