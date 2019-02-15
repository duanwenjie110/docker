# base image
FROM cppbaseos:V1.0.0H1.0.0

# MAINTAINER
MAINTAINER hxie@wtoe.cn

# put linux-urg.tar.bz2 into /usr/local/ and unpack
ADD linux-urg.tar.bz2 /usr/local/

ENV PATH /usr/local/urg/release/app:/usr/local/urg/3rdlibs:$PATH
ENV LD_LIBRARY_PATH /usr/local/urg/release/app:/usr/local/urg/3rdlibs:$LD_LIBRARY_PAT

# copy entrypoint.sh
COPY entrypoint.sh /usr/local/urg/release/app/

#create link
RUN cd /usr/local/urg/3rdlibs && \
ln -fs CuiApp urg && \
cd  /usr/local/urg/release/app/ && \
chmod 777 entrypoint.sh
 
# change dir to /usr/local/urg/
WORKDIR /usr/local/urg/release/app/

# execute command when container exec
ENTRYPOINT ["entrypoint.sh"]

