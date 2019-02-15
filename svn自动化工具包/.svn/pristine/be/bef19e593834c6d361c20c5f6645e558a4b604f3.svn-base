# base image
FROM cppbaseos:V1.0.0H1.0.0

# MAINTAINER
MAINTAINER hxie@wtoe.cn

# put linux-dsaHkUhd.tar.bz2 into /usr/local/ and unpack
ADD linux-dsaHkUhd.tar.bz2 /usr/local/

ENV PATH /usr/local/dsaHkUhd/release/app:/usr/local/dsaHkUhd/3rdlibs:/usr/local/dsaHkUhd/3rdlibs/HCNetSDKCom:$PATH
ENV LD_LIBRARY_PATH /usr/local/dsaHkUhd/release/app:/usr/local/dsaHkUhd/3rdlibs:/usr/local/dsaHkUhd/3rdlibs/HCNetSDKCom:$LD_LIBRARY_PAT

# copy entrypoint.sh
COPY entrypoint.sh /usr/local/dsaHkUhd/release/app/

#create link
RUN cd /usr/local/dsaHkUhd/3rdlibs && \
ln -fs CuiApp dsaHkUhd && \
cd /usr/local/dsaHkUhd/release/app/ && \
chmod 777 entrypoint.sh

# change dir to /usr/local/dsaHkUhd/
WORKDIR /usr/local/dsaHkUhd/release/app/

# execute command when container exec
ENTRYPOINT ["entrypoint.sh"]

