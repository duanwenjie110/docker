# base image
FROM cppbaseos:V1.0.0H1.0.0

# MAINTAINER
MAINTAINER hxie@wtoe.cn

# put linux-umg.tar.bz2 into /usr/local/ and unpack
ADD linux-umg.tar.bz2 /usr/local/

ENV PATH /usr/local/umg/release/app:/usr/local/umg/3rdlibs:$PATH
ENV LD_LIBRARY_PATH /usr/local/umg/release/app:/usr/local/umg/3rdlibs:$LD_LIBRARY_PAT

# copy entrypoint.sh
COPY entrypoint.sh /usr/local/umg/release/app/

#create link
RUN cd /usr/local/umg/3rdlibs && \
ln -fs CuiApp umg && \
cd /usr/local/umg/release/app/ && \
chmod 777 entrypoint.sh

# change dir to /usr/local/umg/
WORKDIR /usr/local/umg/release/app/

# execute command when container exec
ENTRYPOINT ["entrypoint.sh"]

