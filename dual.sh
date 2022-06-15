#!/bin/bash
chmod +x lolMiner
#################################
## Begin of user-editable part ##
#################################

ETHPOOL=eth.2miners.com:2020
ETHWALLET=nano_33y9fjpgynpog1ow4fgrtqitnq36anqeuods5fjrm4sytgp1rfwp19gs35bf
ETHWORKER=guru

TONPOOL=stratum+ssl://ton.sg.hashrate.to:4102
TONWALLET=EQAam9kTLYLMXOi72By0qXnMbmihmQtVQytJ3hMEJtT4kcJO

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

./lolMiner --algo ETHASH --pool $ETHPOOL --user $ETHWALLET --dualmode TONDUAL --dualpool $TONPOOL --dualuser $TONWALLET --worker $ETHWORKER $@
while [ $? -eq 42 ]; do
    sleep 10s
    ./lolMiner --algo ETHASH --pool $ETHPOOL --user $ETHWALLET --dualmode TONDUAL --dualpool $TONPOOL --dualuser $TONWALLET --worker $ETHWORKER $@
done
    
    
