#!/bin/bash
set -e

#debug mode
if [ $# -ge "1" ] && [ $1 == "debug" ]
then
    /bin/bash
else
    exec urg --load=../../config/app/load.js
fi
