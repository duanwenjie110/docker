# base image
FROM cppbaseos:V1.0.0H1.0.0

# MAINTAINER
MAINTAINER hxie@wtoe.cn

# put linux-rss.tar.bz2 into /usr/local and unpack rss
ADD linux-rss.tar.bz2 /usr/local/

ENV PATH /usr/local/rss/release/app:/usr/local/rss/3rdlibs:$PATH
ENV LD_LIBRARY_PATH /usr/local/rss/release/app:/usr/local/rss/3rdlibs:$LD_LIBRARY_PAT

# copy entrypoint.sh
COPY entrypoint.sh /usr/local/rss/release/app/

#
RUN cd /usr/local/rss/3rdlibs && \
ln -fs CuiApp rss && \
cd /usr/local/rss/release/app && \
chmod 777 entrypoint.sh

# change dir to /usr/local/rss/
WORKDIR /usr/local/rss/release/app/

# execute command when container exec
#CMD ["/bin/sh," "entrypoint.sh"]
#CMD /bin/sh 'entrypoint.sh'
ENTRYPOINT ["entrypoint.sh"]

