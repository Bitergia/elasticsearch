#!/bin/bash
ES_PATH="/elasticsearch"
http="https"

set -m

# Add elasticsearch as command if needed
if [ "${1:0:1}" = '-' ]; then
	set -- $ES_PATH/bin/elasticsearch "$@"
fi

$@ &

# Wait to ES
RET=1
while [[ RET -ne 0 ]]; do
    echo "Stalling for Elasticsearch..."
    curl -XGET -k "$http://localhost:9200/_searchguard/license" >/dev/null 2>&1
    RET=$?
    sleep 5
done

$ES_PATH/plugins/search-guard-6/tools/sgadmin.sh -cd $ES_PATH/plugins/search-guard-6/sgconfig -h 0.0.0.0 -icl -nhnv -cacert $ES_PATH/config/root-ca.pem -cert $ES_PATH/config/kirk.pem -key $ES_PATH/config/kirk-key.pem

fg
