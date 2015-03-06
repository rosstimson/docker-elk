#!/bin/bash
if test -z "${ELASTICSEARCH_1_PORT_9200_TCP_ADDR}" -o -z "${ELASTICSEARCH_1_PORT_9200_TCP_PORT}"; then
    echo "You must link this container with elasticsearch first"
    exit 1
fi

export TESTING_ELASTICSEARCH_URI="tcp://${ELASTICSEARCH_1_PORT_9200_TCP_ADDR}:${ELASTICSEARCH_1_PORT_9200_TCP_PORT}"

# See http://tldp.org/LDP/abs/html/devref1.html for description of this syntax.
while ! exec 6<>/dev/tcp/${ELASTICSEARCH_1_PORT_9200_TCP_ADDR}/${ELASTICSEARCH_1_PORT_9200_TCP_PORT}; do
    echo "$(date) - still trying to connect to elasticsearch at ${TESTING_ELASTICSEARCH_URI}"
    sleep 1
done

exec 6>&-
exec 6<&-

exec kibana
