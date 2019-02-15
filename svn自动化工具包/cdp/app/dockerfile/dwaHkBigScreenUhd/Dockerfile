# base image
FROM cppbaseos:V1.0.0H1.0.0

# MAINTAINER
MAINTAINER hxie@wtoe.cn

# put linux-dwaHkBigScreenUhd.tar.bz2 into /usr/local/ and unpack
ADD linux-dwaHkBigScreenUhd.tar.bz2 /usr/local/

ENV PATH /usr/local/dwaHkBigScreenUhd/release/app:/usr/local/dwaHkBigScreenUhd/3rdlibs:/usr/local/dwaHkBigScreenUhd/3rdlibs/HCNetSDKCom:$PATH
ENV LD_LIBRARY_PATH /usr/local/dwaHkBigScreenUhd/release/app:/usr/local/dwaHkBigScreenUhd/3rdlibs:/usr/local/dwaHkBigScreenUhd/3rdlibs/HCNetSDKCom:$LD_LIBRARY_PAT

# copy entrypoint.sh
COPY entrypoint.sh /usr/local/dwaHkBigScreenUhd/release/app/

#create link
RUN cd /usr/local/dwaHkBigScreenUhd/3rdlibs && \
ln -fs CuiApp dwaHkBigScreenUhd && \
cd /usr/local/dwaHkBigScreenUhd/release/app/ && \
chmod 777 entrypoint.sh

# change dir to /usr/local/dwaHkBigScreenUhd/
WORKDIR /usr/local/dwaHkBigScreenUhd/release/app/

# execute command when container exec
ENTRYPOINT ["entrypoint.sh"]

