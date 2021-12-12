FROM ttbb/base

WORKDIR /opt/sh

ARG TARGETARCH

RUN wget https://dl.influxdata.com/influxdb/releases/influxdb2-2.1.1-linux-$TARGETARCH.tar.gz  && \
mkdir -p /opt/sh/influxdb && \
tar -xf /opt/sh/influxdb2-2.1.1-linux-$TARGETARCH.tar.gz -C /opt/sh/influxdb --strip-components 1 && \
chown -R sh:sh /opt/sh && \
rm -rf /opt/sh/influxdb2-2.1.1-linux-$TARGETARCH.tar.gz && \
ln -s /opt/sh/influxdb/influx /usr/bin/influx && \
ln -s /opt/sh/influxdb/influxd /usr/bin/influxd

ENV INFLUX_HOME /opt/sh/influxdb

WORKDIR /opt/sh/influxdb