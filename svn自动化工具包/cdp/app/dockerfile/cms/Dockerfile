# base image
FROM cppbaseos:V1.0.0H1.0.0

# MAINTAINER
MAINTAINER hxie@wtoe.cn

# put linux-cms.tar.bz2 into /usr/local and unpack cms
ADD linux-cms.tar.bz2 /usr/local/

ENV PATH /usr/local/cms/release/app:/usr/local/cms/3rdlibs:$PATH
ENV LD_LIBRARY_PATH /usr/local/cms/release/app:/usr/local/cms/3rdlibs:$LD_LIBRARY_PAT

# copy entrypoint.sh
COPY entrypoint.sh /usr/local/cms/release/app/

#
RUN cd /usr/local/cms/3rdlibs && \
ln -fs CuiApp cms && \
cd /usr/local/cms/release/app && \
chmod 777 entrypoint.sh

# change dir to /usr/local/cms/
WORKDIR /usr/local/cms/release/app/

# execute command when container exec
#CMD ["/bin/sh," "entrypoint.sh"]
#CMD /bin/sh 'entrypoint.sh'
ENTRYPOINT ["entrypoint.sh"]

