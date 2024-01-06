ARG BUILD_FROM
FROM $BUILD_FROM

ARG BUILD_ARCH
ARG FRP_VERSION

COPY bootstrap.sh /
COPY run.sh /
RUN mkdir -p /share/frp
COPY frpc.ini /share/frp

RUN chmod a+x /bootstrap.sh
RUN chmod a+x /run.sh

RUN /bootstrap.sh $BUILD_ARCH $FRP_VERSION

CMD ["/run.sh"]
