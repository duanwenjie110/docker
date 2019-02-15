#! /bin/bash
while(true)
do
    local_dir="/usr/local/freeswitch/bin"
    cd $local_dir
    rm -rf /usr/local/freeswitch/db/*
    ./freeswitch
done
