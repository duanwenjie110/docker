# base image
FROM cppbaseos:V1.0.0H1.0.0

# MAINTAINER
MAINTAINER hxie@wtoe.cn

# put linux-pag.tar.bz2 into /usr/local/ and unpack
ADD linux-pag.tar.bz2 /usr/local/

ENV PATH /usr/local/pag/release/app:/usr/local/pag/3rdlibs:$PATH
ENV LD_LIBRARY_PATH /usr/local/pag/release/app:/usr/local/pag/3rdlibs:$LD_LIBRARY_PAT

# copy entrypoint.sh
COPY entrypoint.sh /usr/local/pag/release/app/

#create link
RUN cd /usr/local/pag/3rdlibs && \
ln -fs CuiApp pag && \
cd /usr/local/pag/release/app/ && \
chmod 777 entrypoint.sh


# change dir to /usr/local/pag/
WORKDIR /usr/local/pag/release/app/

# execute command when container exec
ENTRYPOINT ["entrypoint.sh"]

