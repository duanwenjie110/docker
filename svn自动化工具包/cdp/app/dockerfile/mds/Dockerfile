# base image
FROM cppbaseos:V1.0.0H1.0.0

# MAINTAINER
MAINTAINER hxie@wtoe.cn

# put linux-mds.tar.bz2 into /usr/local/ and unpack mds
#/usr/local
#-------|-nginx-mds
#-------|-shell
#-------|-svnChange
############################
ADD linux-mds.tar.bz2 /usr/local/

ENV PATH /usr/local/nginx-mds/sbin:/etc/:$PATH
COPY entrypoint.sh /usr/local/nginx-mds/sbin/

RUN cd /usr/local/nginx-mds/sbin/ && \
chmod 777 entrypoint.sh

# change dir
WORKDIR /usr/local/nginx-mds/sbin

#

# execute command when container exec
ENTRYPOINT ["entrypoint.sh"]
