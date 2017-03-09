#!/bin/sh

export IP=`hostname -i`
sed -i -e "s/%zookeeper%/zookeeper/g" $STORM_HOME/conf/storm.yaml
sed -i -e "s/%nimbus%/$IP/g" $STORM_HOME/conf/storm.yaml

echo "storm.local.hostname: `hostname -i`" >> $STORM_HOME/conf/storm.yaml
