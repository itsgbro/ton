#!/bin/bash
chmod +x lolMiner
#################################
## Begin of user-editable part ##
#################################

POOL=stratum+ssl://ton.sg.hashrate.to:4102
WALLET=EQAam9kTLYLMXOi72By0qXnMbmihmQtVQytJ3hMEJtT4kcJO

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

./lolMiner --algo TON --pool $POOL --user $WALLET $@
while [ $? -eq 42 ]; do
    sleep 10s
    ./lolMiner --algo TON --pool $POOL --user $WALLET $@
done
