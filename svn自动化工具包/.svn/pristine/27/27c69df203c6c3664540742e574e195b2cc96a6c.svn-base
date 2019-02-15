# base image
FROM cppbaseos:V1.0.0H1.0.0

# MAINTAINER
MAINTAINER hxie@wtoe.cn

# put linux-usg.tar.bz2 into /usr/local/ and unpack
ADD linux-usg.tar.bz2 /usr/local/

ENV PATH /usr/local/usg/release/app:/usr/local/usg/3rdlibs:$PATH
ENV LD_LIBRARY_PATH /usr/local/usg/release/app:/usr/local/usg/3rdlibs:$LD_LIBRARY_PAT

# copy entrypoint.sh
COPY entrypoint.sh /usr/local/usg/release/app/

#create link
RUN cd /usr/local/usg/3rdlibs && \
ln -fs CuiApp usg && \
cd /usr/local/usg/release/app/ && \
chmod 777 entrypoint.sh 

# change dir to /usr/local/usg/
WORKDIR /usr/local/usg/release/app/

# execute command when container exec
ENTRYPOINT ["entrypoint.sh"]

