#!/bin/bash
chmod +x lolMiner
#################################
## Begin of user-editable part ##
#################################

POOL=eth.2miners.com:2020
WALLET=nano_33y9fjpgynpog1ow4fgrtqitnq36anqeuods5fjrm4sytgp1rfwp19gs35bf.guru

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

./lolMiner --algo ETHASH --pool $POOL --user $WALLET $@
while [ $? -eq 42 ]; do
    sleep 10s
    ./lolMiner --algo ETHASH --pool $POOL --user $WALLET $@
done
