#!/bin/bash

screen -wipe
screen -dSm freeswitchKeeper checkFs.sh

#debug mode
if [ $# -ge "1" ] && [ $1 == "debug" ]
then
    /bin/bash
else
	exec ccs --load=../../config/app/load.js
fi

