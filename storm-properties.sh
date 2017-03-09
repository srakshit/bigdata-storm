#!/bin/sh

sed -i -e "s/%zookeeper%/$ZK_ADDR/g" $STORM_HOME/conf/storm.yaml
sed -i -e "s/%nimbus%/$NIMBUS_ADDR/g" $STORM_HOME/conf/storm.yaml

echo "storm.local.hostname: `hostname -i`" >> $STORM_HOME/conf/storm.yaml
