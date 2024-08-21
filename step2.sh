#!/bin/bash
LOCAL_IP=$(hostname -I | awk '{print $1}')

NODE_NUM=$1

KIBANA_CONFIG_PATH="/home/kibana/kibana-8.15.0/config/kibana.yml"

KIBANA_VERSION=8.15.0

cd /home/kibana/kibana-$KIBANA_VERSION/config

tar -zxf certs.tar.gz

chown -R kibana:kibana /home/kibana/kibana-$KIBANA_VERSION/config

echo "Updated server.host to $LOCAL_IP in $KIBANA_CONFIG_PATH"

sed -i "s/^server.host: {localip}/server.host: $LOCAL_IP/" $KIBANA_CONFIG_PATH






