#!/bin/bash
set -e

#del temp file task
echo '0 * * * * root /usr/local/shell/delTemp.sh' >> /etc/crontab
#del log task
echo '0 0 * * * root /usr/local/shell/clear.sh' >> /etc/crontab
#notify mss status task
echo '* * * * * root /usr/local/shell/status.sh' >> /etc/crontab
echo '* * * * * root sleep 5; /usr/local/shell/status.sh' >> /etc/crontab
echo '* * * * * root sleep 10; /usr/local/shell/status.sh' >> /etc/crontab
echo '* * * * * root sleep 15; /usr/local/shell/status.sh' >> /etc/crontab
echo '* * * * * root sleep 20; /usr/local/shell/status.sh' >> /etc/crontab
echo '* * * * * root sleep 25; /usr/local/shell/status.sh' >> /etc/crontab
echo '* * * * * root sleep 30; /usr/local/shell/status.sh' >> /etc/crontab
echo '* * * * * root sleep 35; /usr/local/shell/status.sh' >> /etc/crontab
echo '* * * * * root sleep 40; /usr/local/shell/status.sh' >> /etc/crontab
echo '* * * * * root sleep 45; /usr/local/shell/status.sh' >> /etc/crontab
echo '* * * * * root sleep 50; /usr/local/shell/status.sh' >> /etc/crontab
echo '* * * * * root sleep 55; /usr/local/shell/status.sh' >> /etc/crontab

#start php-fpm
php-fpm start

#start crond
crond

#debug mode
if [ $# -ge "1" ] && [ $1 == "debug" ]
then
    /bin/bash
else
    #start nginx
    exec nginx -g 'daemon off;'
fi
