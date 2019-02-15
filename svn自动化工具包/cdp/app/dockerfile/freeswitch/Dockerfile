# base image
FROM freeswitchenv:V1.0.0H1.0.0

# MAINTAINER
MAINTAINER hxie@wtoe.cn

# put freeswitch-1.6.18.tar.bz2 into /usr/local/ and unpack freeswitch
ADD freeswitch-1.6.18.tar.bz2 /usr/local/
ADD linux-ccs.tar.bz2 /usr/local/

ENV PATH /usr/local/freeswitch/bin:/etc/:$PATH
ENV PATH /usr/local/ccs/release/app:/usr/local/ccs/3rdlibs:$PATH
ENV LD_LIBRARY_PATH /usr/local/ccs/release/app:/usr/local/ccs/3rdlibs:$LD_LIBRARY_PAT

# copy entrypoint.sh
COPY entrypoint.sh /usr/local/ccs/release/app/
COPY checkFs.sh /usr/local/ccs/release/app/

#
RUN cd /usr/local/ccs/3rdlibs && \
ln -fs CuiApp ccs && \
cd /usr/local/ccs/release/app && \
chmod 777 entrypoint.sh && \
chmod 777 checkFs.sh

# change dir to /usr/local/ccs/
WORKDIR /usr/local/ccs/release/app/

# execute command when container exec
ENTRYPOINT ["entrypoint.sh"]

# change dir
#WORKDIR /usr/local/freeswitch/bin

# execute command when container exec
#ENTRYPOINT ["freeswitch"]
