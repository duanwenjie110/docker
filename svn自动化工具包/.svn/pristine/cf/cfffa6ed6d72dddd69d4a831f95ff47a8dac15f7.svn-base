#!/bin/bash
set -e

echo '0 0 * * * root /usr/local/shell/clear.sh' >> /etc/crontab

crond

#debug mode
if [ $# -ge "1" ] && [ $1 == "debug" ]
then
    /bin/bash
else
    exec nginx -g 'daemon off;'
fi
