#!/bin/bash
set -e

#debug mode
if [ $# -ge "1" ] && [$1 == "debug" ]
then
    /bin/bash
else
    exec usg --load=../../config/app/load.js
fi
