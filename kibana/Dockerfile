FROM debian:stable
MAINTAINER Ross Timson <ross@rosstimson.com>

ENV KIBANA_VERSION 4.0.0
ENV KIBANA_ROOT_DIR /kibana

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -y ca-certificates wget \
    && rm -rf /var/lib/apt/lists/* \
    && cd /tmp \
    && wget -q https://download.elasticsearch.org/kibana/kibana/kibana-$KIBANA_VERSION-linux-x64.tar.gz \
    && tar -xzvf ./kibana-$KIBANA_VERSION-linux-x64.tar.gz \
    && mv ./kibana-$KIBANA_VERSION-linux-x64 $KIBANA_ROOT_DIR \
    && rm ./kibana-$KIBANA_VERSION-linux-x64.tar.gz \
    && apt-get purge -y --auto-remove ca-certificates wget

ADD kibana.yml $KIBANA_ROOT_DIR/config/kibana.yml
ADD start.sh $KIBANA_ROOT_DIR/start.sh
RUN chmod +x $KIBANA_ROOT_DIR/start.sh

ENV PATH $KIBANA_ROOT_DIR/bin:$PATH

EXPOSE 5601
WORKDIR $KIBANA_ROOT_DIR
CMD ["./start.sh"]
