FROM java:8-jre
MAINTAINER Ross Timson <ross@rosstimson.com>

ENV LOGSTASH_VERSION 1.4.2
ENV LOGSTASH_ROOT_DIR /logstash

# Download and install Logstash
RUN cd /tmp \
    && wget https://download.elasticsearch.org/logstash/logstash/logstash-$LOGSTASH_VERSION.tar.gz \
    && tar -xzvf ./logstash-$LOGSTASH_VERSION.tar.gz \
    && mv ./logstash-$LOGSTASH_VERSION $LOGSTASH_ROOT_DIR \
    && rm ./logstash-$LOGSTASH_VERSION.tar.gz

# Install contrib plugins
RUN $LOGSTASH_ROOT_DIR/bin/plugin install contrib

ADD logstash.conf $LOGSTASH_ROOT_DIR/logstash.conf
ADD start.sh $LOGSTASH_ROOT_DIR/start.sh
RUN chmod +x $LOGSTASH_ROOT_DIR/start.sh

ENV PATH $LOGSTASH_ROOT_DIR/bin:$PATH

WORKDIR $LOGSTASH_ROOT_DIR
CMD ["./start.sh"]
