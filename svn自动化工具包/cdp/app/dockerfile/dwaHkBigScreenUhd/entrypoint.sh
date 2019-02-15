#!/bin/bash
set -e

#debug mode
if [ $# -ge "3" ] && [ $3 == "debug" ]
then
    /bin/bash
else
    exec dwaHkBigScreenUhd --load=../../config/app/load.js --init=../../config/app/init_Hk_69.js    
fi
